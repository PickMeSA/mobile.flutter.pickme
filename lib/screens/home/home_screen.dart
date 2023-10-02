import 'dart:developer';

import 'package:app/models/user_model.dart';
import 'package:app/screens/profiles/labourer_profile_screen.dart';
import 'package:app/screens/webview_screen.dart';
import 'package:app/services/push_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/advert_model.dart';
import '../../models/review_model.dart';
import '../../widgets/buttons.dart';
import '../../widgets/review_list_item.dart';
import 'all_service_categories_screen.dart';
import 'package:app/screens/notifications_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'dart:io';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../widgets/service_category_icon.dart';
import '../../widgets/service_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

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
  // List<String> selectedCategories = [];

  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  late UserModel thisLabourer;

  bool isLoading = true;

  String? fullName = '';
  String? email = '';
  String? profilePhoto = '';
  String? mobile = '';
  String? userRole = '';
  String? about = '';
  bool displayAbout = true;

  String labourerTypes = 'all';

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        if (mounted) {
          setState(() {
            fullName = snapshot.data()!["fullName"];
            email = snapshot.data()!["email"];
            mobile = snapshot.data()!["mobile"];
            profilePhoto = snapshot.data()!["profileImage"];
            userRole = snapshot.data()!["userRole"];
            if (userRole == 'labourer') {
              thisLabourer = UserModel.fromMap(snapshot.data());
              if (thisLabourer.imageGallery != null) {
                imageGallery = thisLabourer.imageGallery!.toList();
              }
            }
            isLoading = false;
          });
        }
      }
    });
  }

  List<String> categoryFilter = [
    'Cleaning',
    'Repairing',
    'Painting',
    'Laundry',
    'Appliance',
    'Plumbing',
    'Shifting',
    'Beauty',
    'AC Repair',
    'Vehicle',
  ];

  List imageGallery = [];
  List advertList = [];

  // GET LABOURER LISTS
  Stream<List<UserModel>> getLabourerList() => FirebaseFirestore.instance
      .collection('Users')
      .where('enabled', isEqualTo: true)
      .where('userRole', isEqualTo: 'labourer')
      .where('serviceCategories', arrayContainsAny: categoryFilter)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList());

  Stream<List<UserModel>> getLabourerListIndividuals() => FirebaseFirestore
      .instance
      .collection('Users')
      .where('enabled', isEqualTo: true)
      .where('userRole', isEqualTo: 'labourer')
      .where('serviceCategories', arrayContainsAny: categoryFilter)
      .where('labourerType', isEqualTo: 'individual')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList());

  Stream<List<UserModel>> getLabourerListBusiness() => FirebaseFirestore
      .instance
      .collection('Users')
      .where('enabled', isEqualTo: true)
      .where('userRole', isEqualTo: 'labourer')
      .where('serviceCategories', arrayContainsAny: categoryFilter)
      .where('labourerType', isEqualTo: 'business')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList());

  // BUILD SERVICE PROVIDER
  Widget buildUser(UserModel user) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LabourerProfileScreen(
                labourer: user,
                customerName: fullName ?? '',
              ),
            ),
          );
        },
        child: ServiceListItem(userModel: user),
      );

  Widget filterButton(String value, String label, Color color) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: value == labourerTypes ? color : color.withOpacity(0.25),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: value == labourerTypes ? Colors.white : color,
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  List<SelectItem> serviceCategories = [
    SelectItem(
      icon: 'assets/icons/services/cleaning.svg',
      label: 'Cleaning',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/repairing.svg',
      label: 'Repairing',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/painting.svg',
      label: 'Painting',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/laundry.svg',
      label: 'Laundry',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/appliance.svg',
      label: 'Appliance',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/plumbing.svg',
      label: 'Plumbing',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/shifting.svg',
      label: 'Shifting',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/beauty.svg',
      label: 'Beauty',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/ac_repair.svg',
      label: 'AC Repair',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/vehicle.svg',
      label: 'Vehicle',
      selected: true,
    ),
    SelectItem(
      icon: 'assets/icons/services/electronics.svg',
      label: 'Electronics',
      selected: false,
    ),
    SelectItem(
      icon: 'assets/icons/services/massage.svg',
      label: 'Massage',
      selected: false,
    ),
    SelectItem(
      icon: 'assets/icons/services/mens_sal.svg',
      label: "Men's Sal..",
      selected: false,
    ),
  ];

  // GET REVIEWS LISTS
  Stream<List<ReviewModel>> getReviewList() => FirebaseFirestore.instance
      .collection('Reviews')
      .where('labourer', isEqualTo: thisLabourer.uid)
      .orderBy('date')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => ReviewModel.fromMap(doc.data())).toList());

  // BUILD REVIEW
  Widget buildReview(ReviewModel review) {
    return ReviewListItem(
      review: review,
    );
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
          .ref('galleries/${thisLabourer.uid}/$filename.png')
          .putFile(uploadFile);
      fileURL = await firebase_storage.FirebaseStorage.instance
          .ref('galleries/${thisLabourer.uid}/$filename.png')
          .getDownloadURL();

      imageGallery.add(fileURL);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'imageGallery': imageGallery});
      _getUserFromDatabase();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletePhoto(fileToDelete) async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .refFromURL(fileToDelete)
          .delete();
      imageGallery.remove(fileToDelete);
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'imageGallery': imageGallery});
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
          : userRole == 'customer'
              ? buildCustomerScaffold(context)
              : userRole == 'labourer'
                  ? buildLabourerScaffold(context)
                  : const Center(
                      child: Text('Unable to get User Role'),
                    ),
    );
  }

  //SIGNED IN AS CUSTOMER
  Scaffold buildCustomerScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: profilePhoto == '' || profilePhoto == null
              ? CircleAvatar(
                  backgroundColor: Palette.lightGreen.withOpacity(0.5),
                  child: const Icon(
                    Icons.person,
                    color: Palette.lightGreen,
                  ),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(
                    profilePhoto!,
                  ),
                  radius: 24,
                ),
        ),
        leadingWidth: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              style: TextStyle(
                  color: Palette.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              fullName!,
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: SvgPicture.asset('assets/icons/notification.svg'),
        //     ),
        //   ),
        //   GestureDetector(
        //     onTap: () {
        //       print('OPEN BOOKMARKS SCREEN');
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: SvgPicture.asset('assets/icons/bookmark.svg'),
        //     ),
        //   ),
        //   const SizedBox(width: 10),
        // ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                        customerName: fullName ?? '',
                                      )));
                        },
                        child: TextField(
                          decoration: kTextFieldDecoration.copyWith(
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.lightGrey, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            hintText: 'Search',
                            enabled: false,
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/search.svg',
                              fit: BoxFit.none,
                              color: Palette.grey,
                            ),
                            suffixIcon: SvgPicture.asset(
                              'assets/icons/filter.svg',
                              fit: BoxFit.none,
                              color: Palette.green,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Services',
                        style: kHeadingTextStyle,
                      ),
                      /*
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AllServiceCategoriesScreen()));
                          //showAllServiceCategoriesModal(context);
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Palette.green,
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  const SizedBox(height: 10),
                  MultiSelectDialogField(
                    searchable: true,
                    searchHint: 'Search for a service category',
                    items:
                        categories.map((e) => MultiSelectItem(e, e)).toList(),
                    title: Text("Service Categories"),
                    selectedColor: Palette.green,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(250, 250, 250, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    buttonIcon: Icon(
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
                      if (results.isNotEmpty) {
                        setState(() => {categoryFilter = results});
                      } else {
                        setState(() => {
                              categoryFilter = [
                                'Cleaning',
                                'Repairing',
                                'Painting',
                                'Laundry',
                                'Appliance',
                                'Plumbing',
                                'Shifting',
                                'Beauty',
                                'AC Repair',
                                'Vehicle',
                              ]
                            });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  // SizedBox(
                  //   height: 90,
                  //   child: ListView(
                  //     clipBehavior: Clip.none,
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     children: serviceCategories,
                  //   ),
                  // ),
                  /*SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      children: List<Widget>.generate(
                        serviceCategories.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (serviceCategories[index].selected) {
                                  if (categoryFilter.length > 1) {
                                    categoryFilter.removeWhere((element) =>
                                        serviceCategories[index].label ==
                                        element);
                                    serviceCategories[index].selected =
                                        !serviceCategories[index].selected;
                                    print(categoryFilter);
                                    print(
                                        '${serviceCategories[index].label} = ${serviceCategories[index].selected}');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'At least one category must be selected'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } else {
                                  if (categoryFilter.length < 10) {
                                    categoryFilter
                                        .add(serviceCategories[index].label);
                                    serviceCategories[index].selected =
                                        !serviceCategories[index].selected;
                                    print(categoryFilter);
                                    print(
                                        '${serviceCategories[index].label} = ${serviceCategories[index].selected}');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Select up to 10 categories only'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              });
                            },
                            child: serviceCategory(
                                icon: serviceCategories[index].icon,
                                label: serviceCategories[index].label,
                                selected: serviceCategories[index].selected),
                          );
                        },
                      ),
                    ),
                  ),*/

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/cleaning.svg',
                  //       label: 'Cleaning',
                  //     ),
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/repairing.svg',
                  //       label: 'Repairing',
                  //     ),
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/painting.svg',
                  //       label: 'Painting',
                  //     ),
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/laundry.svg',
                  //       label: 'Laundry',
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/appliance.svg',
                  //       label: 'Appliance',
                  //     ),
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/plumbing.svg',
                  //       label: 'Plumbing',
                  //     ),
                  //     serviceCategory(
                  //       icon: 'assets/icons/services/shifting.svg',
                  //       label: 'Shifting',
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(context, MaterialPageRoute(builder: (context) => AllServiceCategoriesScreen()));
                  //       },
                  //       child: serviceCategory(
                  //         icon: 'assets/icons/services/more.svg',
                  //         label: 'More',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      labourerTypes = 'all';
                    });
                  },
                  child: filterButton('all', 'All', Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      labourerTypes = 'individuals';
                    });
                  },
                  child:
                      filterButton('individuals', 'Individuals', Palette.green),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      labourerTypes = 'business';
                    });
                  },
                  child: filterButton('business', 'Businesses', Colors.blue),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<UserModel>>(
              stream: labourerTypes == 'business'
                  ? getLabourerListBusiness()
                  : labourerTypes == 'individuals'
                      ? getLabourerListIndividuals()
                      : getLabourerList(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'There was an error trying to locate service providers. Please try again later.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final users = snapshot.data;
                  if (users!.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'No service providers found',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return ListView(
                    children: users.map(buildUser).toList(),
                  );
                } else {
                  return Center(
                    child: spinLoader,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  //SIGNED IN AS LABOURER
  Scaffold buildLabourerScaffold(BuildContext context) {
    num overallRating = thisLabourer.overallRating == null
        ? 0
        : thisLabourer.overallRating! /
            thisLabourer.numberOfReviews!.toDouble();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: profilePhoto == '' || profilePhoto == null
              ? CircleAvatar(
                  backgroundColor: Palette.lightGreen.withOpacity(0.5),
                  child: const Icon(
                    Icons.person,
                    color: Palette.lightGreen,
                  ),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(
                    profilePhoto!,
                  ),
                  radius: 24,
                ),
        ),
        leadingWidth: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              style: TextStyle(
                  color: Palette.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              fullName!,
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       print('OPEN BOOKMARKS SCREEN');
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 10),
        //       child: SvgPicture.asset('assets/icons/bookmark.svg'),
        //     ),
        //   ),
        //   const SizedBox(width: 10),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Image gallery',
                style: kHeadingTextStyle,
              ),
              const SizedBox(height: 10),
              imageGallery.isNotEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                              height: 75,
                              child: ListView.builder(
                                  itemCount: thisLabourer.imageGallery?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onLongPress: () {
                                        showDeleteImageDialog(context,
                                            thisLabourer.imageGallery?[index]);
                                      },
                                      child: Container(
                                        width: 50,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          color: Palette.green.withOpacity(0.1),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(thisLabourer
                                                .imageGallery?[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (imageGallery.length < 5) {
                              pickImage();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Maximum of 5 images allowed.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: smallButton(
                              label: '+',
                              color: Palette.green,
                              textColor: Colors.white),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Text('You have no images.'),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (imageGallery.length < 5) {
                                pickImage();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Maximum of 5 images allowed.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: smallButton(
                                label: '+',
                                color: Palette.green,
                                textColor: Colors.white),
                          ),
                        ),
                      ],
                    ),
              if (thisLabourer.serviceCategories != null)
                const SizedBox(height: 10),
              if (thisLabourer.serviceCategories != null)
                SizedBox(
                  height: 24,
                  child: ListView.builder(
                      itemCount: thisLabourer.serviceCategories?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Palette.green.withOpacity(0.1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            thisLabourer.serviceCategories?[index],
                            style: const TextStyle(
                              color: Palette.green,
                              fontSize: 10,
                            ),
                          ),
                        );
                      }),
                ),
              const SizedBox(height: 10),
              if (thisLabourer.address != '' && thisLabourer.address != null)
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Palette.green,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        thisLabourer.address ?? '',
                      ),
                    ),
                  ],
                ),
              Row(
                children: [
                  Text(
                    'R${thisLabourer.rate ?? ' ?'}',
                    style: const TextStyle(
                      color: Palette.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Per Hour',
                    style: const TextStyle(
                      color: Palette.darkGrey,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              const Divider(),
              if (thisLabourer.about != '' && thisLabourer.about != null)
                const SizedBox(height: 10),
              if (thisLabourer.about != '' && thisLabourer.about != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About Me',
                      style: kHeadingTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('hide');
                        setState(() {
                          displayAbout = !displayAbout;
                        });
                      },
                      child: Text(
                        displayAbout ? 'Hide' : 'Show',
                        style: TextStyle(
                          color: Palette.green,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              if (thisLabourer.about != '' && thisLabourer.about != null)
                const SizedBox(height: 10),
              if (displayAbout) Text(thisLabourer.about ?? ''),
              if (thisLabourer.about != '' && thisLabourer.about != null)
                const SizedBox(height: 20),
              const Text(
                'Reviews',
                style: kHeadingTextStyle,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Palette.yellow,
                  ),
                  Text(
                    ' ${overallRating.isNaN ? '0' : overallRating.toStringAsFixed(overallRating.truncateToDouble() == overallRating ? 0 : 1)} (${thisLabourer.numberOfReviews ?? '0'} reviews)',
                    style: const TextStyle(
                      color: Palette.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<List<ReviewModel>>(
                  stream: getReviewList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            'There was an error connecting to the server. Please try again later.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final reviews = snapshot.data;
                      if (reviews!.isEmpty) {
                        return const Center(
                          child: Text(
                            'You have not been rated yet',
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return ListView(
                        children: reviews.map(buildReview).toList(),
                      );
                    } else {
                      return Center(
                        child: spinLoader,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDeleteImageDialog(BuildContext context, String fileToDelete) {
    Dialog alert = Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Are you sure you want to delete this image?"),
            const SizedBox(height: 20),
            Image.network(fileToDelete),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: greyButton(label: 'No'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await deletePhoto(fileToDelete);

                      Navigator.pop(context);
                    },
                    child: greenButton(label: 'Yes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<dynamic> showAllServiceCategoriesModal(BuildContext context) {
    int? selectedType = 0;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setFilterState) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: List<Widget>.generate(
                serviceCategories.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (serviceCategories[index].selected) {
                          if (categoryFilter.length > 1) {
                            categoryFilter.removeWhere((element) =>
                                serviceCategories[index].label == element);
                            serviceCategories[index].selected =
                                !serviceCategories[index].selected;
                            print(categoryFilter);
                            print(
                                '${serviceCategories[index].label} = ${serviceCategories[index].selected}');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'At least one category must be selected'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        } else {
                          if (categoryFilter.length < 10) {
                            categoryFilter.add(serviceCategories[index].label);
                            serviceCategories[index].selected =
                                !serviceCategories[index].selected;
                            print(categoryFilter);
                            print(
                                '${serviceCategories[index].label} = ${serviceCategories[index].selected}');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Select up to 10 categories only'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      });
                    },
                    child: serviceCategory(
                        icon: serviceCategories[index].icon,
                        label: serviceCategories[index].label,
                        selected: serviceCategories[index].selected),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectItem {
  String label;
  String icon;
  bool selected;
  SelectItem({
    required this.label,
    required this.icon,
    required this.selected,
  });
}
