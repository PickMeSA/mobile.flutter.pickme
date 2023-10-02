import 'package:app/components/constants.dart';
import 'package:app/components/service_constants.dart';
import 'package:app/screens/profiles/edit_profile.dart';
import 'package:app/widgets/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:io';

import '../../components/palette.dart';
import '../pdf_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  bool isLoading = true;
  String? fullName = '';
  String? email = '';
  String? profilePhoto = '';
  String? mobile = '';
  String? pushToken = '';

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        if (mounted) {
          setState(() {
            fullName = snapshot.data()!["fullName"];
            email = snapshot.data()!["email"];
            mobile = snapshot.data()!["mobile"];
            profilePhoto = snapshot.data()!["profileImage"];
            pushToken = snapshot.data()!["pushToken"];
            isLoading = false;
          });
        }
      }
    });
  }

  void pickImage() async {
    photo =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 25);
    uploadPhoto();
    setState(() {});
  }

  Future<void> uploadPhoto() async {
    File uploadFile = File(photo!.path);
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    String fileURL;
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('profile_images/$filename.png')
          .putFile(uploadFile);
      fileURL = await firebase_storage.FirebaseStorage.instance
          .ref('profile_images/$filename.png')
          .getDownloadURL();

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profileImage': fileURL});
      _getUserFromDatabase();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Center(
              child: spinLoader,
            )
          : Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset('assets/images/logo_small.png'),
                ),
                title: const Text('Profile'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      profilePhoto == '' || profilePhoto == null
                          ? CircleAvatar(
                              backgroundColor:
                                  Palette.lightGreen.withOpacity(0.5),
                              radius: 60,
                              child: const Icon(
                                Icons.person,
                                color: Palette.lightGreen,
                                size: 65,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                profilePhoto!,
                              ),
                              radius: 60,
                            ),
                      GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Palette.green,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    fullName!,
                    style: kHeadingTextStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    email!,
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: SvgPicture.asset(
                              'assets/icons/profile_outline.svg'),
                          title: const Text('Edit Profile'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfileScreen()))
                                .then((value) => _getUserFromDatabase());
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset('assets/icons/lock.svg'),
                          title: const Text('Privacy Policy'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PDFScreen(
                                  pdfUrl: privacyPolicyUrl,
                                  title: 'Privacy Policy',
                                ),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: SvgPicture.asset('assets/icons/logout.svg'),
                          title: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            showLogoutModal(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<dynamic> showLogoutModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Logout',
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                'Are you sure you want to log out?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: smallLightGreenButton(label: 'No'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        FirebaseAuth.instance.signOut();
                      },
                      child: smallGreenButton(label: 'Yes')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
