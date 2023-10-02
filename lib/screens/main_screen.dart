import 'package:app/components/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/palette.dart';

import '../models/advert_model.dart';
import 'bookings/bookings_screen.dart';
import 'home/home_screen.dart';
import 'chat/inbox_screen.dart';
import 'profiles/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late TabController tabController;

  final screens = [
    HomeScreen(),
    BookingsScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  // GET ADVERTISEMENTS
  Stream<List<AdvertModel>> getAdvertisementList() => FirebaseFirestore.instance
      .collection('Advertisements')
      .where('enabled', isEqualTo: true)
      //.where('startDate', isLessThanOrEqualTo: DateTime.now())
      .where('endDate', isGreaterThanOrEqualTo: DateTime.now())
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => AdvertModel.fromMap(doc.data())).toList());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          final message = 'Press back again to exit';
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          return false;
        } else {
          ScaffoldMessenger.of(context).clearSnackBars();
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              StreamBuilder(
                  stream: getAdvertisementList(),
                  builder: (context, snap) {
                    if (snap.hasError) {
                      return Text('${snap.error}');
                    }
                    if (snap.connectionState == ConnectionState.waiting) {
                      return spinLoader;
                    }
                    if (snap.hasData) {
                      List advertList = snap.data!.toList();
                      if (advertList.isEmpty) {
                        return const SizedBox(height: 10);
                      }
                      return CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 80,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            viewportFraction: 1,
                          ),
                          itemCount: advertList.length,
                          itemBuilder: (context, index, realIndex) {
                            Color color = Colors.grey;
                            if (advertList[index].color != null) {
                              color = Color(int.parse('0xFF${advertList[index].color}'));
                            }
                            return GestureDetector(
                              onTap: () async {
                                final url = Uri.parse(advertList[index].url);

                                if (!await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: color,
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(advertList[index].image),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return const SizedBox(height: 10);
                  }),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: screens,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                tabController.index = index;
                currentIndex = index;
                // if (index == 0) {
                //   setState(() => currentIndex = index);
                // }
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: currentIndex,
            unselectedItemColor: Palette.grey,
            selectedItemColor: Palette.green,
            items: [
              bottomNavBarItem(index: 0, label: 'Home'),
              bottomNavBarItem(index: 1, label: 'Bookings'),
              bottomNavBarItem(index: 2, label: 'Inbox'),
              bottomNavBarItem(index: 3, label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  bottomNavBarItem({
    required int index,
    required String label,
  }) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset(
            currentIndex == index ? 'assets/icons/${label.toLowerCase()}.svg' : 'assets/icons/${label.toLowerCase()}_outline.svg',
            color: currentIndex == index ? Palette.green : Palette.grey,
          ),
        ),
        label: label);
  }
}
