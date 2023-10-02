import 'package:app/screens/auth/change_password_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../main.dart';
import '../../widgets/buttons.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _updateProfileFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  List<String> categories = [
    'AC Repair',
    'Academic',
    'Accounting',
    'Admin',
    'Advertising',
    'Appliance',
    'Automotive',
    'Aviation',
    'Banking',
    'Beauty',
    'Call Centre',
    'Carpentry',
    'Chemical',
    'Cleaning',
    'Clothing',
    'Construction',
    'Consulting',
    'Defence',
    'Design Services',
    'E-Commerce',
    'Education',
    'Electronics',
    'Engineering',
    'Entertainment',
    'Environmental',
    'Farming',
    'Fashion',
    'Finance',
    'Fitness',
    'General worker',
    'Government',
    'Healthcare',
    'Hospitality',
    'Human Resources',
    'IT',
    'Import & Export',
    'Insurance',
    'Investment',
    'Laundry',
    'Legal',
    'Logistics',
    'Management',
    'Manufacturing',
    'Market Research',
    'Marketing',
    'Massage',
    'Media',
    'Medical',
    'Men\'s Sal..',
    'Mining',
    'NGO',
    'PR & Communication',
    'Painting',
    'Petrochemical',
    'Pharmaceutical',
    'Real Estate',
    'Recruitment',
    'Repairing',
    'Research',
    'Retail',
    'Sales',
    'Security',
    'Shifting',
    'Social Services',
    'Sports',
    'Technology',
    'Telecommunications',
    'Trades & Services',
    'Transport',
    'Travel & Tourism',
    'Vehicle',
    'Warehousing'
  ];
  List<String> selectedCategories = [];

  bool isLoading = true;
  String currentEmail = '';
  bool hidePassword = true;
  String userRole = '';

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          _nameController.text = snapshot.data()!["fullName"];
          _emailController.text = snapshot.data()!["email"];
          currentEmail = snapshot.data()!["email"];
          _mobileController.text = snapshot.data()!["mobile"];
          userRole = snapshot.data()!["userRole"];
          if (snapshot.data()!["serviceCategories"] != null) {
            for (var cat in snapshot.data()!["serviceCategories"]) {
              selectedCategories.add(cat.toString());
            }
          }
          isLoading = false;
        });
      }
    });
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  updateUserEmail() async {
    try {
      await FirebaseAuth.instance.currentUser
          ?.updateEmail(_emailController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Please enter your current password'),
                content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setAlertState) {
                  return Form(
                    key: _passwordFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          obscureText: hidePassword,
                          decoration: kTextFieldDecoration.copyWith(
                            label: const Text('Password'),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Palette.grey,
                              size: 20,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setAlertState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              child: Icon(
                                hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:
                                    hidePassword ? Palette.grey : Palette.green,
                                size: 20,
                              ),
                            ),
                          ),
                          validator: (val) {
                            return val!.isEmpty
                                ? 'Please enter Password'
                                : null;
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            if (_passwordFormKey.currentState!.validate()) {
                              final user = FirebaseAuth.instance.currentUser;
                              try {
                                user!.reauthenticateWithCredential(
                                    EmailAuthProvider.credential(
                                  email: currentEmail,
                                  password: _passwordController.text,
                                ));
                              } catch (e) {
                                print(currentEmail);
                                print('*********************************');
                                print(e);
                              }
                            }
                          },
                          child: greenButton(label: 'Submit'),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            navigatorKey.currentState!.pop();
                          },
                          child: smallButton(
                              label: 'Cancel',
                              color: Palette.grey,
                              textColor: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              );
            });
      } else {
        print(e.code);
      }
    }
  }

  changeEmail() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'email': _emailController.text});
  }

  updateUser() async {
    setState(() {
      isLoading = true;
    });
    if (_emailController.text != currentEmail) {
      await updateUserEmail();
      changeEmail();
    }
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'fullName': _nameController.text,
        'mobile': _mobileController.text,
        'serviceCategories': userRole == 'labourer' ? selectedCategories : null,
      });
      print('USER UPDATED');
    } catch (e) {
      print(e);
      print('USER NOT UPDATED');
    }
    _getUserFromDatabase();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserFromDatabase();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
          ),
          body: isLoading
              ? spinLoader
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: _updateProfileFormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                  decoration: kTextFieldDecoration.copyWith(
                                    label: const Text('Full Name'),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Palette.grey,
                                      size: 20,
                                    ),
                                  ),
                                  validator: (val) {
                                    return val!.isEmpty
                                        ? 'Please enter Full Name'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _mobileController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  decoration: kTextFieldDecoration.copyWith(
                                    label: const Text('Mobile'),
                                    prefixIcon: const Icon(
                                      Icons.phone_android,
                                      color: Palette.grey,
                                      size: 20,
                                    ),
                                  ),
                                  validator: (val) {
                                    return val!.isEmpty
                                        ? 'Please enter Mobile Number'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: kTextFieldDecoration.copyWith(
                                    label: const Text('Email'),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Palette.grey,
                                      size: 20,
                                    ),
                                  ),
                                  validator: (val) {
                                    return val!.isEmpty
                                        ? 'Please enter Email'
                                        : null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                Stack(
                                  children: [
                                    TextField(
                                      decoration: kTextFieldDecoration.copyWith(
                                        disabledBorder:
                                            const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.lightGrey,
                                              width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                        hintText: 'Password',
                                        enabled: false,
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Palette.grey,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 15,
                                      top: 15,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ChangePasswordScreen()));
                                          },
                                          child: const Text(
                                            'Change Password',
                                            style:
                                                TextStyle(color: Palette.green),
                                          )),
                                    ),
                                  ],
                                ),
                                if (userRole == 'labourer')
                                  Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      MultiSelectDialogField(
                                        initialValue: selectedCategories,
                                        items: categories
                                            .map((e) => MultiSelectItem(e, e))
                                            .toList(),
                                        title: const Text("Service Categories"),
                                        selectedColor: Palette.green,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(250, 250, 250, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        buttonIcon: const Icon(
                                          Icons.work,
                                          color: Palette.grey,
                                        ),
                                        buttonText: Text(
                                          "Select Service Categories",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                          ),
                                        ),
                                        onConfirm: (results) {
                                          selectedCategories = results;
                                        },
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (!keyboardOpen)
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: isLoading
                            ? spinLoader
                            : GestureDetector(
                                onTap: () {
                                  if (_updateProfileFormKey.currentState!
                                      .validate()) {
                                    updateUser();
                                  }
                                },
                                child: greenButton(label: 'Update'),
                              ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
