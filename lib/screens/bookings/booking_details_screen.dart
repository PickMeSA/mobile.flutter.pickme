import 'dart:async';
import 'dart:developer';

import 'package:app/components/service_constants.dart';
import 'package:app/models/pickup_location_model.dart';
import 'package:app/models/user_model.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/services/network_service.dart';
import 'package:app/widgets/list_item_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../components/utils.dart';
import '../../main.dart';
import '../../services/push_service.dart';
import '../../widgets/buttons.dart';
import '../../widgets/service_list_item.dart';
import '../home/home_screen.dart';
import '../profiles/labourer_profile_screen.dart';

class BookingDetailScreen extends StatefulWidget {
  BookingDetailScreen({Key? key, required this.labourer}) : super(key: key);

  final UserModel labourer;

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  late UserModel labourer;

  final authUser = FirebaseAuth.instance.currentUser!;
  late UserModel currentUser;

  bool isLoading = true;

  final PageController _pageController = PageController(keepPage: true);
  var currentPage = 0;
  bool displayDetails = false;

  late GooglePlace jobPlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;
  String? jobAddress;
  late LatLng userPosition;
  late Position jobPosition;
  late Position pickupPosition;

  double camLat = -25.746473;
  double camLng = 28.187441;

  double? jobLat;
  double? jobLng;

  late GoogleMapController _mapController;

  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2022, 1);
  final lastDate = DateTime(2024, 12);
  TimeOfDay startTime = const TimeOfDay(hour: 07, minute: 00);
  int workingHours = 0;

  calcEndTime(TimeOfDay startTime, int duration) {
    TimeOfDay endTime =
        TimeOfDay(hour: startTime.hour + duration, minute: startTime.minute);
    return endTime;
  }

  final TextEditingController _jobDetailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dialogAddressController =
      TextEditingController();

  String jobCategory = 'none';

  final Set<Marker> _markers = {};

  void placeJobMarker({required LatLng pos}) async {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('jobMarker'),
          position: pos,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );

      getAddressFromLatLong(pos);
    });
  }

  Future<void> _moveToNewLocation(LatLng newPos) async {
    setState(() {
      camLat = newPos.latitude;
      camLng = newPos.longitude;
      _mapController.animateCamera(CameraUpdate.newLatLngZoom(newPos, 15));
    });
  }

  Future _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position userLatLng = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userPosition = LatLng(userLatLng.latitude, userLatLng.longitude);
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future getAddressFromLatLong(LatLng position) async {
    List placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    setState(() {
      jobAddress =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      jobLat = position.latitude;
      jobLng = position.longitude;
      _addressController.text = jobAddress!;
    });
  }

  void useCurrentUserLocation() async {
    await _getGeoLocationPosition();
    await getAddressFromLatLong(userPosition);
    placeJobMarker(pos: userPosition);
    _moveToNewLocation(userPosition);
    setState(() {
      _addressController.text = jobAddress!;
      jobLat = userPosition.latitude;
      jobLng = userPosition.longitude;
    });
  }

  void toggleDetailsDisplay() {
    setState(() {
      displayDetails = !displayDetails;
    });
  }

  calcRate({required int userRate, required int hours}) {
    double amount = (userRate * hours).toDouble();
    return amount;
  }

  // calcContribution({required int userRate, required int hours}) {
  //   double amount = (userRate / 10) * hours;
  //   return amount;
  // }

  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
      'maps.googleapis.com',
      'maps/api/place/autocomplete/json',
      {
        'input': query,
        'types': 'address',
        'language': 'en',
        'key': apiKey,
      },
    );

    String? response = await NetworkUtil().fetchUrl(uri);
    if (response != null) {
      print(response);
    }
  }

  Future<void> requestBooking() async {
    if (jobCategory != 'none' &&
        jobAddress != null &&
        workingHours != 0 &&
        _jobDetailController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: spinLoader,
        ),
      );
      try {
        final bookingDoc =
            FirebaseFirestore.instance.collection('Bookings').doc();
        await bookingDoc.set({
          'id': bookingDoc.id,
          'date': selectedDate,
          'startTime': startTime.format(context),
          'endTime': calcEndTime(startTime, workingHours).format(context),
          'duration': workingHours,
          'details': _jobDetailController.text,
          'amount':
              calcRate(userRate: labourer.rate!.toInt(), hours: workingHours),
          // 'amount': (calcRate(userRate: labourer.rate!.toInt(), hours: workingHours)+calcContribution(userRate: labourer.rate!.toInt(), hours: workingHours)),
          'labourer': labourer.toBookingLabourerMap(),
          'customer': currentUser.toBookingCustomerMap(),
          'category': jobCategory,
          'address': jobAddress,
          'lat': jobLat,
          'lng': jobLng,
          'status': 'request',
        });
        if (labourer.pushToken != null) {
          sendNotificationToPlayer(labourer.pushToken!, 'Booking Request',
              'You have received a new booking request from ${currentUser.fullName}');
        } else {
          log('no token');
        }
      } catch (e) {
        Utils.showSnackBar(text: e.toString());
      }
      navigatorKey.currentState!.pop();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'THANK YOU',
                    style: TextStyle(
                      color: Palette.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Your booking has been requested.'),
                  const SizedBox(height: 10),
                  Text(
                    'Once the request has been accepted it will display under your booking requests, ready for payment.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    },
                    child: smallGreenButton(label: 'Close'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      Utils.showSnackBar(
          text: 'Booking information incomplete', color: Colors.red);
    }
  }

  Future _getUserFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        currentUser = UserModel.chatUserFromMap({
          'uid': snapshot.data()!["uid"],
          'fullName': snapshot.data()!["fullName"],
          'mobile': snapshot.data()!["mobile"],
          'email': snapshot.data()!["email"],
          'profileImage': snapshot.data()!["profileImage"],
          'pushToken': snapshot.data()!["pushToken"],
        });
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    });
  }

  // GET PICKUP POINT LIST
  Stream<List<PickupLocationModel>> getPickupLocationsList() =>
      FirebaseFirestore.instance
          .collection('PickupLocations')
          .where('enabled', isEqualTo: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => PickupLocationModel.fromMap(doc.data()))
              .toList());

  // BUILD SERVICE PROVIDER
  Widget buildLocation(PickupLocationModel location) => GestureDetector(
        onTap: () {
          setState(() {
            placeJobMarker(
                pos: LatLng(
              double.parse(location.lat!.toString()),
              double.parse(location.lng!.toString()),
            ));
            _moveToNewLocation(LatLng(
              double.parse(location.lat!.toString()),
              double.parse(location.lng!.toString()),
            ));
            jobAddress = location.address!;
            jobLat = double.parse(location.lat!.toString());
            jobLng = double.parse(location.lng!.toString());
          });
          Navigator.pop(context);
        },
        // child: ServiceListItem(userModel: user),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location.address!),
            Divider(),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    labourer = widget.labourer;
    _getUserFromDatabase();
    jobPlace = GooglePlace(apiKey);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _jobDetailController.dispose();
    _addressController.dispose();
    _dialogAddressController.dispose();
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
            title: const Text('Booking Details'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    _dateTimePage(),
                    _detailsPage(),
                    _addressPage(),
                    _summaryPage(),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
              if (!keyboardOpen)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      // if (currentPage != 0)
                      //   Expanded(
                      //     child: GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             _pageController.animateToPage(
                      //               currentPage - 1,
                      //               duration: const Duration(milliseconds: 350),
                      //               curve: Curves.easeOutSine,
                      //             );
                      //           });
                      //         },
                      //         child: greyButton(label: 'Back')),
                      //   ),
                      // if (currentPage != 0) const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            currentPage == 0
                                ? workingHours == 0
                                    ? Utils.showSnackBar(
                                        text: 'Please select more than 0 hours',
                                        color: Colors.red)
                                    : setState(() {
                                        _pageController.animateToPage(
                                          1,
                                          duration:
                                              const Duration(milliseconds: 350),
                                          curve: Curves.easeOutSine,
                                        );
                                      })
                                : currentPage == 1
                                    ? _jobDetailController.text.isEmpty ||
                                            jobCategory == "none"
                                        ? Utils.showSnackBar(
                                            text:
                                                'Please give some details about the job and select a category',
                                            color: Colors.red)
                                        : setState(() {
                                            _pageController.animateToPage(
                                              2,
                                              duration: const Duration(
                                                  milliseconds: 350),
                                              curve: Curves.easeOutSine,
                                            );
                                          })
                                    : currentPage == 2
                                        ? jobLat == null
                                            ? Utils.showSnackBar(
                                                text:
                                                    'Please select a location',
                                                color: Colors.red)
                                            : setState(() {
                                                _pageController.animateToPage(
                                                  3,
                                                  duration: const Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeOutSine,
                                                );
                                              })
                                        : requestBooking();
                            // currentPage != 3
                            //     ? setState(() {
                            //         _pageController.animateToPage(
                            //           currentPage + 1,
                            //           duration: const Duration(milliseconds: 350),
                            //           curve: Curves.easeOutSine,
                            //         );
                            //       })
                            //     : requestBooking();
                          },
                          child: greenButton(
                              label: currentPage != 3 ? 'Continue' : 'Request'),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateTimePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Text(
                  'Select Date',
                  style: kHeadingTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Palette.green.withOpacity(0.15),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: lastDate,
                onDateChanged: (newDate) {
                  selectedDate = newDate;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Start Time',
                  style: kHeadingTextStyle,
                ),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? newTime = await showTimePicker(
                      context: context,
                      initialTime: startTime,
                    );
                    if (newTime == null) return;
                    setState(() {
                      startTime = newTime;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Palette.brightGreen,
                    ),
                    child: Text(
                      startTime.format(context),
                      style: kHeadingTextStyle.copyWith(color: Palette.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListItemCard(
            Row(
              children: [
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Working Hours',
                        style: kHeadingTextStyle,
                      ),
                      SizedBox(height: 5),
                      Text('Working Hours'),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      if (workingHours > 0) {
                        setState(() {
                          workingHours--;
                        });
                      }
                    },
                    child: smallButton(
                        label: '-',
                        color: Palette.brightGreen,
                        textColor: Palette.green)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    workingHours.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        workingHours++;
                      });
                    },
                    child: smallButton(
                        label: '+',
                        color: Palette.brightGreen,
                        textColor: Palette.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailsPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Text(
                'Job Details',
                style: kHeadingTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _jobDetailController,
            maxLines: 5,
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'Add details here'),
            // validator: (val) {
            //   return val!.isEmpty ? 'Please enter Job Details' : null;
            // },
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Category',
                style: kHeadingTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (labourer.serviceCategories != null)
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                labourer.serviceCategories!.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        jobCategory = labourer.serviceCategories![index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: labourer.serviceCategories?[index] == jobCategory
                            ? Palette.green
                            : Palette.green.withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        labourer.serviceCategories?[index],
                        style: TextStyle(
                          color:
                              labourer.serviceCategories?[index] == jobCategory
                                  ? Colors.white
                                  : Palette.green,
                          fontWeight:
                              labourer.serviceCategories?[index] == jobCategory
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _addressPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: const [
              Text(
                'Job Location',
                style: kHeadingTextStyle,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  color: Colors.black12,
                  child: GoogleMap(
                    onMapCreated: (controller) {
                      _mapController = controller;
                    },
                    markers: _markers,
                    mapToolbarEnabled: false,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(camLat, camLng),
                      zoom: 15,
                    ),
                    onTap: (LatLng latLng) {
                      placeJobMarker(pos: latLng);
                    },
                  )),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: const SizedBox(width: 40, height: 4),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Location Details',
                          style: kAppBarTitleTextStyle.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Address',
                    style: kHeadingTextStyle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showPickupPointsDialog();
                        },
                        child: smallButton(
                            label: 'Use PickMe Up Location',
                            color: Palette.brightGreen,
                            textColor: Palette.green),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          useCurrentUserLocation();
                        },
                        child: smallButton(
                            label: 'Use current location',
                            color: Palette.brightGreen,
                            textColor: Palette.green),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showAddressDialog();
                },
                child: TextFormField(
                  controller: _addressController,
                  enabled: false,
                  decoration: kTextFieldDecoration.copyWith(
                    disabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Palette.lightGrey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    hintText: 'Add address here',
                    suffixIcon: const Icon(Icons.location_on),
                  ),
                  // validator: (val) {
                  //   return val!.isEmpty ? 'Please enter Job Details' : null;
                  // },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> showAddressDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setDialogState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              if (_debounce?.isActive ?? false)
                                _debounce!.cancel();
                              _debounce = Timer(
                                  const Duration(milliseconds: 1000), () async {
                                if (value.isNotEmpty) {
                                  if (value.length > 2) {
                                    var result =
                                        await jobPlace.autocomplete.get(
                                      value,
                                      region: 'za',
                                    );
                                    if (result != null &&
                                        result.predictions != null &&
                                        mounted) {
                                      setDialogState(() {
                                        predictions = result.predictions!;
                                      });
                                    }
                                  }
                                } else {
                                  setDialogState(() {
                                    predictions.clear();
                                  });
                                }
                              });
                            },
                            controller: _dialogAddressController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: kTextFieldDecoration.copyWith(
                              disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Palette.lightGrey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              hintText: 'Add address here',
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setDialogState(() {
                                      predictions.clear();
                                      _dialogAddressController.clear();
                                    });
                                  },
                                  child: const Icon(Icons.close)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Close'),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: predictions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(predictions[index].description.toString()),
                          onTap: () async {
                            final placeId = predictions[index].placeId!;
                            final details = await jobPlace.details.get(placeId);
                            if (details != null &&
                                details.result != null &&
                                mounted) {
                              setState(() {
                                _dialogAddressController.text =
                                    details.result!.formattedAddress!;
                                _addressController.text =
                                    details.result!.formattedAddress!;
                                predictions = [];
                                getAddressFromLatLong(LatLng(
                                  details.result!.geometry!.location!.lat!,
                                  details.result!.geometry!.location!.lng!,
                                ));
                                placeJobMarker(
                                    pos: LatLng(
                                  details.result!.geometry!.location!.lat!,
                                  details.result!.geometry!.location!.lng!,
                                ));
                                _moveToNewLocation(LatLng(
                                  details.result!.geometry!.location!.lat!,
                                  details.result!.geometry!.location!.lng!,
                                ));
                              });
                              if (mounted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showPickupPointsDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 300,
                    child: StreamBuilder<List<PickupLocationModel>>(
                      stream: getPickupLocationsList(),
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
                          final pickupLocations = snapshot.data;
                          if (pickupLocations!.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  'No locations found',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                          return ListView(
                            children:
                                pickupLocations.map(buildLocation).toList(),
                          );
                        } else {
                          return Center(
                            child: spinLoader,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: smallButton(
                        label: 'Close',
                        color: Palette.grey,
                        textColor: Colors.white),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }

  Widget _summaryPage() {
    //double contribution = calcContribution(userRate: labourer.rate!.toInt(), hours: workingHours);
    double amount =
        calcRate(userRate: labourer.rate!.toInt(), hours: workingHours);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Text(
                  'Review Summary',
                  style: kHeadingTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListItemCard(
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Service Category',
                      ),
                      Text(
                        jobCategory,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color:
                              jobCategory == 'none' ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Worker',
                      ),
                      Text(
                        labourer.fullName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Date & Time',
                      ),
                      Text(
                        '${DateFormat('MMM d, yyyy').format(selectedDate)} | ${startTime.format(context)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Working Hours',
                      ),
                      Text(
                        workingHours == 1
                            ? '${workingHours.toString()} hour'
                            : '${workingHours.toString()} hours',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                workingHours == 0 ? Colors.red : Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListItemCard(
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Job Details',
                      ),
                      GestureDetector(
                        onTap: () {
                          toggleDetailsDisplay();
                        },
                        child: Icon(
                          displayDetails
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  if (displayDetails) const SizedBox(height: 10),
                  if (displayDetails)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(_jobDetailController.text),
                      ],
                    ),
                ],
              ),
            ),
          ),
          ListItemCard(
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jobCategory == 'none'
                            ? 'No category selected'
                            : jobCategory,
                      ),
                      Text(
                        labourer.rate != null
                            ? 'R ${amount.toStringAsFixed(2)}'
                            : 'User rate not set',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Retirement contribution'
                  //     ),
                  //     Text(
                  //       labourer.rate != null
                  //           ? 'R ${contribution.toStringAsFixed(2)}'
                  //           : 'User rate not set',
                  //       style: const TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                      ),
                      Text(
                        labourer.rate != null
                            // ? 'R ${(amount+contribution).toStringAsFixed(2)}'
                            ? 'R ${amount.toStringAsFixed(2)}'
                            : 'User rate not set',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (jobCategory == 'none')
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutSine,
                  );
                },
                child: smallButton(
                    label: 'Please select a category',
                    color: Colors.red,
                    textColor: Colors.white),
              ),
            ),
          if (workingHours == 0)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutSine,
                  );
                },
                child: smallButton(
                    label: 'Please select working hours more than 0',
                    color: Colors.red,
                    textColor: Colors.white),
              ),
            ),
          if (_jobDetailController.text.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutSine,
                  );
                },
                child: smallButton(
                    label: 'Please enter some details about the job',
                    color: Colors.red,
                    textColor: Colors.white),
              ),
            ),
          if (jobAddress == null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutSine,
                  );
                },
                child: smallButton(
                    label: 'Please select an address',
                    color: Colors.red,
                    textColor: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
