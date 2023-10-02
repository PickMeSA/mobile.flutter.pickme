import 'package:app/screens/profiles/labourer_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../components/constants.dart';
import '../components/palette.dart';
import '../components/utils.dart';
import '../models/user_model.dart';
import '../widgets/buttons.dart';
import '../widgets/service_list_item.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    super.key,
    required this.customerName,
  });

  final String customerName;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String customerName = '';
  CollectionReference _firebaseFireStore =
      FirebaseFirestore.instance.collection('Users');
  List<UserModel> labourers = [];
  List<UserModel> searchResults = [];
  bool displayResults = false;
  String filterField = 'fullName';

  num userLat = 9999.99999;
  num userLng = 9999.99999;

  double filterDistance = 100.0;
  double defaultFilterDistance = 100.0;

  int defaultFilterRating = 0;
  int filterRating = 0;

  List defaultFilterCategories = [
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
    'Warehousing',
  ];
  List labourerTypes = [
    'individual',
    'business',
  ];
  List filterCategories = [];
  bool categoriesCleared = false;

  int defaultFilterMinPrice = 0;
  int filterMinPrice = 0;
  int defaultFilterMaxPrice = 99999999;
  int filterMaxPrice = 99999999;
  String queryString = 'defaultSearchString';
  String defaultMinPrice = '0';
  String minPrice = '0';
  String defaultMaxPrice = '800';
  String maxPrice = '800';
  RangeValues _priceRangeValues = RangeValues(0.0, 800.0);

  Stream<List<UserModel>> getUserList() => FirebaseFirestore.instance
      .collection('Users')
      .where('enabled', isEqualTo: true)
      .where('userRole', isEqualTo: 'labourer')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList());

  Future getLabourers() async {
    var allLabourers = await _firebaseFireStore
        .where('enabled', isEqualTo: true)
        .where('userRole', isEqualTo: 'labourer')
        .get();
    setState(() {
      labourers = List.from(
          allLabourers.docs.map((doc) => UserModel.fromSnapshot(doc)));
    });
  }

  void applyFilters(int selectedType) {
    if (selectedType == 1) {
      labourerTypes = [
        'business',
      ];
    } else if (selectedType == 2) {
      labourerTypes = [
        'individual',
      ];
    } else {
      labourerTypes = [
        'individual',
        'business',
      ];
    }
    List<UserModel> newList = labourers
        .where((l) =>
            (l.fullName!.toLowerCase().contains(queryString) ||
                l.about!.toLowerCase().contains(queryString)) &&
            labourerTypes.contains(l.labourerType))
        .toList();

    if (userLat == 9999.99999) {
      List<UserModel> filteredList = newList
          .where((l) =>
              l.rate! > filterMinPrice &&
              l.rate! < filterMaxPrice &&
              l.overallRating! >= filterRating &&
              (filterCategories.isEmpty ||
                  l.serviceCategories!.any(
                          (element) => filterCategories.contains(element)) ==
                      true))
          .toList();
      searchResults = filteredList;
    } else {
      {
        List<UserModel> filteredList = newList
            .where((l) =>
                l.rate! > filterMinPrice &&
                l.rate! < filterMaxPrice &&
                l.overallRating! >= filterRating &&
                (filterCategories.isEmpty ||
                    l.serviceCategories!.any(
                            (element) => filterCategories.contains(element)) ==
                        true) &&
                calDistance(
                        labourerLat: l.lat,
                        labourerLng: l.lng,
                        customerLat: userLat,
                        customerLng: userLng) <=
                    filterDistance)
            .toList();
        searchResults = filteredList;
      }
    }

    setState(() {});
  }

  Future _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      //Utils.showSnackBar(text: 'Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //Utils.showSnackBar(text: 'Location permissions are denied.');
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      //Utils.showSnackBar(text: 'Location permissions are permanently denied, we cannot request permissions.');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position userLatLng = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userLat = userLatLng.latitude;
    userLng = userLatLng.longitude;

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  calDistance({
    required labourerLat,
    required labourerLng,
    required customerLat,
    required customerLng,
  }) {
    num distance = (Geolocator.distanceBetween(
            labourerLat, labourerLng, customerLat, customerLng) /
        1000);
    return distance;
  }

  Widget buildUser(UserModel user) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LabourerProfileScreen(
                  labourer: user,
                  customerName: customerName,
                ),
              ),
            );
          });
        },
        child: Stack(children: [
          ServiceListItem(userModel: user),
          if (userLat != 9999.99999)
            Positioned(
              top: 5,
              right: 25,
              child: Text(
                '${calDistance(
                  labourerLat: user.lat,
                  labourerLng: user.lng,
                  customerLat: userLat,
                  customerLng: userLng,
                ).toStringAsFixed(1)} km',
                style: const TextStyle(fontSize: 9, color: Colors.red),
              ),
            ),
        ]),
      );

  List<int> ratingOptions = [
    5,
    4,
    3,
    2,
    1,
  ];

  List<SelectItem> categoryList = [
    SelectItem(title: 'AC Repair', selected: false),
    SelectItem(title: 'Academic', selected: false),
    SelectItem(title: 'Accounting', selected: false),
    SelectItem(title: 'Admin', selected: false),
    SelectItem(title: 'Advertising', selected: false),
    SelectItem(title: 'Appliance', selected: false),
    SelectItem(title: 'Automotive', selected: false),
    SelectItem(title: 'Aviation', selected: false),
    SelectItem(title: 'Banking', selected: false),
    SelectItem(title: 'Beauty', selected: false),
    SelectItem(title: 'Call Centre', selected: false),
    SelectItem(title: 'Carpentry', selected: false),
    SelectItem(title: 'Chemical', selected: false),
    SelectItem(title: 'Cleaning', selected: false),
    SelectItem(title: 'Clothing', selected: false),
    SelectItem(title: 'Construction', selected: false),
    SelectItem(title: 'Consulting', selected: false),
    SelectItem(title: 'Defence', selected: false),
    SelectItem(title: 'Design Services', selected: false),
    SelectItem(title: 'E-Commerce', selected: false),
    SelectItem(title: 'Education', selected: false),
    SelectItem(title: 'Electronics', selected: false),
    SelectItem(title: 'Engineering', selected: false),
    SelectItem(title: 'Entertainment', selected: false),
    SelectItem(title: 'Environmental', selected: false),
    SelectItem(title: 'Farming', selected: false),
    SelectItem(title: 'Fashion', selected: false),
    SelectItem(title: 'Finance', selected: false),
    SelectItem(title: 'Fitness', selected: false),
    SelectItem(title: 'General worker', selected: false),
    SelectItem(title: 'Government', selected: false),
    SelectItem(title: 'Healthcare', selected: false),
    SelectItem(title: 'Hospitality', selected: false),
    SelectItem(title: 'Human Resources', selected: false),
    SelectItem(title: 'IT', selected: false),
    SelectItem(title: 'Import & Export', selected: false),
    SelectItem(title: 'Insurance', selected: false),
    SelectItem(title: 'Investment', selected: false),
    SelectItem(title: 'Laundry', selected: false),
    SelectItem(title: 'Legal', selected: false),
    SelectItem(title: 'Logistics', selected: false),
    SelectItem(title: 'Management', selected: false),
    SelectItem(title: 'Manufacturing', selected: false),
    SelectItem(title: 'Market Research', selected: false),
    SelectItem(title: 'Marketing', selected: false),
    SelectItem(title: 'Massage', selected: false),
    SelectItem(title: 'Media', selected: false),
    SelectItem(title: 'Medical', selected: false),
    SelectItem(title: 'Men\'s Sal..', selected: false),
    SelectItem(title: 'Mining', selected: false),
    SelectItem(title: 'NGO', selected: false),
    SelectItem(title: 'PR & Communication', selected: false),
    SelectItem(title: 'Painting', selected: false),
    SelectItem(title: 'Petrochemical', selected: false),
    SelectItem(title: 'Pharmaceutical', selected: false),
    SelectItem(title: 'Real Estate', selected: false),
    SelectItem(title: 'Recruitment', selected: false),
    SelectItem(title: 'Repairing', selected: false),
    SelectItem(title: 'Research', selected: false),
    SelectItem(title: 'Retail', selected: false),
    SelectItem(title: 'Sales', selected: false),
    SelectItem(title: 'Security', selected: false),
    SelectItem(title: 'Shifting', selected: false),
    SelectItem(title: 'Social Services', selected: false),
    SelectItem(title: 'Sports', selected: false),
    SelectItem(title: 'Technology', selected: false),
    SelectItem(title: 'Telecommunications', selected: false),
    SelectItem(title: 'Trades & Services', selected: false),
    SelectItem(title: 'Transport', selected: false),
    SelectItem(title: 'Travel & Tourism', selected: false),
    SelectItem(title: 'Vehicle', selected: false),
    SelectItem(title: 'Warehousing', selected: false),
  ];

  bool allCategoriesSelected = false;

  bool allRatingsSelected = false;

  List<SelectItem> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    customerName = widget.customerName;
    getLabourers();
    _getGeoLocationPosition();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.pop(context);
                });
              },
              child: const Icon(Icons.arrow_back),
            ),
            title: TextField(
              onChanged: (value) {
                if (value.length > 2) {
                  final newList = labourers.where((l) {
                    final fullNameLower = l.fullName!.toLowerCase();
                    final taglineLower = l.tagline!.toLowerCase();
                    final aboutLower = l.about!.toLowerCase();
                    final queryLower = value.toLowerCase();

                    return fullNameLower.contains(queryLower) ||
                        aboutLower.contains(queryLower) ||
                        taglineLower.contains(queryLower);
                  }).toList();
                  setState(() {
                    searchResults = newList;
                    displayResults = true;
                    queryString = value.toLowerCase();
                  });
                }
                if (value.length < 3) {
                  setState(() {
                    displayResults = false;
                    getLabourers();
                    queryString = 'defaultSearchString';
                  });
                }
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Search',
                prefixIcon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  fit: BoxFit.none,
                  color: Palette.grey,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    showFiltersModal(context).then((value) => setState(() {}));
                  },
                  child: SvgPicture.asset(
                    'assets/icons/filter.svg',
                    fit: BoxFit.none,
                    color: Palette.green,
                  ),
                ),
              ),
            ),
          ),
          body: displayResults
              ? searchResults.isEmpty
                  ? notFound()
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text('Results for "'),
                              Text(
                                queryString,
                                style: const TextStyle(color: Palette.green),
                              ),
                              const Text('"'),
                              Expanded(
                                  child: Text(
                                '${searchResults.length.toString()} found',
                                style: const TextStyle(color: Palette.green),
                                textAlign: TextAlign.end,
                              )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return buildUser(searchResults[index]);
                            },
                          ),
                        ),
                      ],
                    )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Type at least 3 characters to start search',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text('Results are from labourer\'s'),
                        const Text('name or description.'),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/filter.svg',
                              fit: BoxFit.none,
                              color: Palette.green,
                            ),
                            const Text('   Filters search results.'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget notFound() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 250),
                      child: Image.asset(
                        'assets/images/notfound.png',
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Not Found',
                        style: kHeadingTextStyle,
                      ),
                    ),
                    Text(
                      'Sorry, no data found for "$queryString"',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ratingSelection({required int rating}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: rating == filterRating ? Palette.green : Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Palette.green,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 7,
          top: 4,
          right: 10,
          bottom: 4,
        ),
        child: Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: rating == filterRating ? Colors.white : Palette.green,
              size: 15,
            ),
            const SizedBox(width: 5),
            Text(
              rating.toString(),
              style: TextStyle(
                color: rating == filterRating ? Colors.white : Palette.green,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categorySelection({required SelectItem category}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: category.selected ? Palette.green : Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Palette.green, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 10,
        ),
        child: Text(
          category.title,
          style: TextStyle(
            color: category.selected ? Colors.white : Palette.green,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<dynamic> showFiltersModal(BuildContext context) {
    int? selectedType = 0;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setFilterState) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Filter',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: selectedType,
                      onChanged: (value) {
                        setFilterState(() {
                          selectedType = value;
                        });
                      },
                    ),
                    GestureDetector(
                        onTap: () {
                          setFilterState(() {
                            selectedType = 0;
                          });
                        },
                        child: Text('All')),
                    Radio(
                      value: 1,
                      groupValue: selectedType,
                      onChanged: (value) {
                        setFilterState(() {
                          selectedType = value;
                        });
                      },
                    ),
                    GestureDetector(
                        onTap: () {
                          setFilterState(() {
                            selectedType = 1;
                          });
                        },
                        child: Text('Business')),
                    Radio(
                      value: 2,
                      groupValue: selectedType,
                      onChanged: (value) {
                        setFilterState(() {
                          selectedType = value;
                        });
                      },
                    ),
                    GestureDetector(
                        onTap: () {
                          setFilterState(() {
                            selectedType = 2;
                          });
                        },
                        child: Text('Individual')),
                  ],
                ),
                const SizedBox(height: 10),
                MultiSelectDialogField(
                  initialValue: filterCategories,
                  searchable: true,
                  searchHint: 'Search for a service category',
                  items: defaultFilterCategories
                      .map((e) => MultiSelectItem(e, e))
                      .toList(),
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
                    setState(() => {filterCategories = results});
                  },
                ),
                /*
                Row(
                  children: [
                    const Expanded(
                        child: Text('Category', style: kHeadingTextStyle)),
                    allCategoriesSelected
                        ? GestureDetector(
                            onTap: () {
                              setFilterState(() {
                                //filterCategories.clear();
                                categoriesCleared = true;
                                for (var element in categoryList) {
                                  element.selected = false;
                                }
                                allCategoriesSelected = false;
                              });
                            },
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Palette.green,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setFilterState(() {
                                filterCategories.clear();
                                for (var element in categoryList) {
                                  filterCategories.add(element.title);
                                  element.selected = true;
                                }
                                allCategoriesSelected = true;
                              });
                            },
                            child: const Text(
                              'All',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Palette.green,
                              ),
                            ),
                          )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxHeight: 28),
                  clipBehavior: Clip.none,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setFilterState(() {
                            if (categoryList[index].selected) {
                              filterCategories.removeWhere((element) =>
                                  categoryList[index].title == element);
                              if (filterCategories.isEmpty) {
                                filterCategories = defaultFilterCategories;
                              }
                              print(filterCategories);
                            } else {
                              if (categoriesCleared) {
                                filterCategories.clear();
                                categoriesCleared = false;
                              }
                              filterCategories.add(categoryList[index].title);

                              print(filterCategories);
                            }
                            categoryList[index].selected =
                                !categoryList[index].selected;
                          });
                        },
                        child: categorySelection(category: categoryList[index]),
                      );
                    },
                  ),
                ),*/
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(
                        child: Text('Price', style: kHeadingTextStyle)),
                    const Text(
                      'Min ',
                      style: TextStyle(color: Palette.grey),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: Palette.greenGradient,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        'R$minPrice',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      '     Max ',
                      style: TextStyle(color: Palette.grey),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: Palette.greenGradient,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        'R$maxPrice',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                  min: 0,
                  max: 2000,
                  values: _priceRangeValues,
                  onChanged: (RangeValues values) {
                    setFilterState(() {
                      _priceRangeValues = values;
                      minPrice = _priceRangeValues.start.round().toString();
                      maxPrice = _priceRangeValues.end.round().toString();
                    });
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const Expanded(
                        child: Text('Min Rating', style: kHeadingTextStyle)),
                    GestureDetector(
                      onTap: () {
                        setFilterState(() {
                          filterRating = 0;
                        });
                      },
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Palette.green,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxHeight: 28),
                  clipBehavior: Clip.none,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: ratingOptions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            setFilterState(() {
                              filterRating = ratingOptions[index];
                            });
                          },
                          child: ratingSelection(rating: ratingOptions[index]));
                    },
                  ),
                ),
                const SizedBox(height: 20),
                userLat == 9999.99999
                    ? GestureDetector(
                        onTap: () {
                          _getGeoLocationPosition();
                        },
                        child: const Text(
                            'Please allow access to location for distance filter.'))
                    : Row(
                        children: [
                          const Expanded(
                              child: Text('Max Distance',
                                  style: kHeadingTextStyle)),
                          Container(
                            decoration: BoxDecoration(
                              gradient: Palette.greenGradient,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              '${filterDistance.round()} km',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                if (userLat != 9999.99999)
                  Slider(
                    value: filterDistance,
                    max: 200,
                    label: filterDistance.round().toString(),
                    onChanged: (double value) {
                      setFilterState(() {
                        filterDistance = value;
                      });
                    },
                  ),
                const Divider(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          List<UserModel> newList = labourers
                              .where((l) =>
                                  l.fullName!
                                      .toLowerCase()
                                      .contains(queryString) ||
                                  l.about!.toLowerCase().contains(queryString))
                              .toList();
                          searchResults = newList;
                          setFilterState(() {
                            filterRating = defaultFilterRating;
                            filterDistance = defaultFilterDistance;
                            filterMinPrice = defaultFilterMinPrice;
                            filterMaxPrice = defaultFilterMaxPrice;
                            minPrice = defaultMinPrice;
                            maxPrice = defaultMaxPrice;
                            _priceRangeValues = RangeValues(
                                double.parse(defaultMinPrice.toString()),
                                double.parse(defaultMaxPrice.toString()));
                          });
                          Navigator.pop(context);
                          setState(() {
                            labourerTypes = [
                              'individual',
                              'business',
                            ];
                          });
                        },
                        child: smallLightGreenButton(label: 'Reset'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                          onTap: () async {
                            setFilterState(() {
                              filterMinPrice = _priceRangeValues.start.round();
                              filterMaxPrice = _priceRangeValues.end.round();

                              applyFilters(selectedType!);
                            });
                            Navigator.pop(context);
                          },
                          child: smallGreenButton(label: 'Filter')),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SelectItem {
  String title;
  bool selected;
  SelectItem({
    required this.title,
    required this.selected,
  });
}
