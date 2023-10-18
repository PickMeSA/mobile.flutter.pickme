import 'package:app/features/login/presentation/login_screen.dart';
import 'package:app/screens/auth/reset_password_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../components/constants.dart';
import '../../components/palette.dart';
import '../../components/utils.dart';
import '../../main.dart';
import '../../models/user_model.dart';
import '../../widgets/buttons.dart';
import '../main_screen.dart';
import 'dart:io';

enum Gender { none, male, female }

class RegisterPersonalDetails extends StatefulWidget {
  final String userrole;

  const RegisterPersonalDetails({Key? key, required this.userrole})
      : super(key: key);

  @override
  State<RegisterPersonalDetails> createState() =>
      _RegisterPersonalDetailsState();
}

class _RegisterPersonalDetailsState extends State<RegisterPersonalDetails> {
  final _registerFormKey = GlobalKey<FormState>();
  late String userrole;

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

  List<String> languages = [
    'Afrikaans',
    'English',
    'Sotho',
    'Swati',
    'Tsonga',
    'Tswana',
    'Venda',
    'Xhosa',
    'Zulu'
  ];
  List<String> selectedLanguages = [];

  List<String> provinces = <String>[
    // '',
    'Eastern Cape',
    'Free State',
    'Gauteng',
    'KwaZulu-Natal',
    'Limpopo',
    'Mpumalanga',
    'North West',
    'Northern Cape',
    'Western Cape',
  ];

  bool hidePassword = true;
  bool isLoading = false;
  bool? rememberMe = false;
  bool keyboardOpen = false;
  Gender? gender = Gender.none;

  // String selectedProvince = '';
  String? selectedProvince;
  int step = 1;
  late int steps = 1;
  String userUid = '';

  int profileImage = 0;
  int addressImage = 0;
  int idPassFile = 0;
  int passportphoto = 0;
  int workPermitFile = 0;

  List<String> qualificationsFiles = [];
  List<String> workExperienceFiles = [];

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  // New Fields
  final TextEditingController _nickName = TextEditingController();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _passportNumber = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _address3 = TextEditingController();
  final TextEditingController _workpermitNumber = TextEditingController();
  final TextEditingController _alternativeContact = TextEditingController();

  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _companyRegNo = TextEditingController();

  final TextEditingController _about = TextEditingController();
  final TextEditingController _workExperience = TextEditingController();
  final TextEditingController _membership = TextEditingController();
  final TextEditingController _rate = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  // --- Uploads ---
  // Photo
  // ID
  // Passport
  // Work Permit
  // Qualifications
  // Address
  // Work Pictures
  // Fingerprints
  // Photo Owner (business)

  void _togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  void pickImage({required String docType}) async {
    XFile? photo =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 25);
    setState(() {
      isLoading = true;
    });
    File uploadFile = File(photo!.path);
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    String fileURL;
    try {
      String remotePath =
          docType == 'profileImage' ? 'profile_images' : 'documents';
      await firebase_storage.FirebaseStorage.instance
          .ref('$remotePath/$filename.png')
          .putFile(uploadFile);
      fileURL = await firebase_storage.FirebaseStorage.instance
          .ref('$remotePath/$filename.png')
          .getDownloadURL();

      if (docType == 'profileImage') {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'profileImage': fileURL});
        profileImage = 1;
      } else if (docType == 'addressImage') {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          docType: fileURL,
        });
        addressImage = 1;
      } else if (docType == 'idPassFile') {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          docType: fileURL,
        });
        idPassFile = 1;
      } else if (docType == 'passportphoto') {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          docType: fileURL,
        });
        passportphoto = 1;
      } else if (docType == 'workPermitFile') {
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          docType: fileURL,
        });
        workPermitFile = 1;
      } else if (docType == 'qualificationsFile') {
        qualificationsFiles.add(fileURL);
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          docType: qualificationsFiles,
        });
      } else if (docType == 'workExperienceFile') {
        workExperienceFiles.add(fileURL);
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          docType: workExperienceFiles,
        });
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future submitForm1() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text.trim(),
      );
      UserModel user = UserModel(
        uid: authResult.user?.uid,
        fullName: _nameController.text,
        email: authResult.user?.email,
        mobile: _mobileController.text,
      );
      userUid = authResult.user?.uid ?? '';
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(authResult.user?.uid)
          .set({
        'uid': user.uid,
        'fullName': user.fullName,
        'nickName': _nickName.text,
        'mobile': user.mobile,
        'email': user.email,
        'userRole': userrole == 'customer' ? 'customer' : 'labourer',
        'labourerType': userrole == 'labourer' ? 'individual' : 'business',
        'enabled': userrole == 'customer' ? true : false,
        'profileImage': '',
        'gender': gender == Gender.male ? 'M' : 'F',
        'serviceCategories': selectedCategories,
        'languages': selectedLanguages,
        'idPass': _idNumber.text,
        'passportNumber': _passportNumber.text,
        'workPermit': _workpermitNumber.text,
        'alternativeContact': _alternativeContact.text,
        'address':
            '${_address1.text}, ${_address2.text}, ${_address3.text}, ${selectedProvince ?? ''}',
        'companyName': userrole == 'business' ? _companyName.text : null,
        'companyReg': userrole == 'business' ? _companyRegNo.text : null,
      });
      if (userrole == 'customer') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        setState(() {
          step = 2;
        });
      }
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future submitForm2() async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'serviceCategories': selectedCategories,
        'rate': double.parse(_rate.text),
        'about': _about.text,
        'workExperience': _workExperience.text,
        'membership': _membership.text,
      });
      setState(() {
        step = 3;
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message);
    }
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Form personalDetailsForm() {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userrole == 'business'
              ? TextFormField(
                  controller: _companyName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: kTextFieldDecoration.copyWith(
                    label: const Text('Company Name'),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Palette.grey,
                      size: 20,
                    ),
                  ),
                  validator: (val) {
                    return val!.isEmpty ? 'Please enter Company Name' : null;
                  },
                )
              : const SizedBox(height: 0),
          userrole == 'business'
              ? const SizedBox(height: 20)
              : const SizedBox(height: 0),
          userrole == 'business'
              ? TextFormField(
                  controller: _companyRegNo,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: kTextFieldDecoration.copyWith(
                    label: const Text('Company Registration Number'),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Palette.grey,
                      size: 20,
                    ),
                  ),
                  validator: (val) {
                    return val!.isEmpty
                        ? 'Please enter Company Registration Number'
                        : null;
                  },
                )
              : const SizedBox(height: 0),
          userrole == 'business'
              ? const SizedBox(height: 20)
              : const SizedBox(height: 0),
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
              return val!.isEmpty ? 'Please enter Full Name' : null;
            },
          ),
          userrole != 'customer'
              ? const SizedBox(height: 20)
              : const SizedBox(height: 0),
          userrole != 'customer'
              ? TextFormField(
                  controller: _nickName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: kTextFieldDecoration.copyWith(
                    label: const Text('Nick Name'),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Palette.grey,
                      size: 20,
                    ),
                  ),
                  validator: (val) {
                    return val!.isEmpty ? 'Please enter Nick Name' : null;
                  },
                )
              : const SizedBox(height: 0),
          userrole == 'labourer'
              ? Row(
                  children: [
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: const Text('Male'),
                        value: Gender.male,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<Gender>(
                        title: const Text('Female'),
                        value: Gender.female,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox(height: 0),
          userrole == 'labourer'
              ? const SizedBox(height: 0)
              : const SizedBox(height: 20),
          MultiSelectDialogField(
            items: languages.map((e) => MultiSelectItem(e, e)).toList(),
            title: Text("Languages"),
            selectedColor: Palette.green,
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            buttonIcon: Icon(
              Icons.language,
              color: Palette.grey,
            ),
            buttonText: Text(
              "Select Languages",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
            onConfirm: (results) {
              selectedLanguages = results;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _idNumber,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('ID Number'),
              prefixIcon: const Icon(
                Icons.person,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter ID Number' : null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _passportNumber,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('Passport Number'),
              prefixIcon: const Icon(
                Icons.person,
                color: Palette.grey,
                size: 20,
              ),
            ),
            // validator: (val) {
            //   return val!.isEmpty ? 'Please enter Passport Number' : null;
            // },
          ),
          userrole != 'customer'
              ? const SizedBox(height: 20)
              : const SizedBox(height: 0),
          userrole != 'customer'
              ? TextFormField(
                  controller: _workpermitNumber,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  decoration: kTextFieldDecoration.copyWith(
                    label: const Text('Work Permit Number'),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Palette.grey,
                      size: 20,
                    ),
                  ),
                  validator: (val) {
                    return val!.isEmpty
                        ? 'Please enter Work Permit Number'
                        : null;
                  },
                )
              : const SizedBox(height: 0),
          const SizedBox(height: 20),
          TextFormField(
            controller: _address1,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('Street Address'),
              prefixIcon: const Icon(
                Icons.location_city,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter street address' : null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _address2,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('Suburb'),
              prefixIcon: const Icon(
                Icons.location_city,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter suburb' : null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _address3,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('City'),
              prefixIcon: const Icon(
                Icons.location_city,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter city' : null;
            },
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(250, 250, 250, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              value: selectedProvince,
              icon: const Icon(
                Icons.arrow_downward,
                color: Colors.grey,
              ),
              hint: Text(
                "Province",
                style: GoogleFonts.urbanist(),
              ),
              isExpanded: true,
              underline: Container(),
              elevation: 16,
              style: GoogleFonts.urbanist().copyWith(
                color: Colors.grey,
                fontSize: 16,
              ),
              borderRadius: BorderRadius.circular(12),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  selectedProvince = value!;
                });
              },
              items: provinces.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
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
              return val!.isEmpty ? 'Please enter Mobile Number' : null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _alternativeContact,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
              label: const Text('Alternative Contact'),
              prefixIcon: const Icon(
                Icons.phone_android,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter alternative contact' : null;
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
              return val!.isEmpty ? 'Please enter Email' : null;
            },
          ),
          const SizedBox(height: 20),
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
                  _togglePassword();
                },
                child: Icon(
                  hidePassword ? Icons.visibility : Icons.visibility_off,
                  color: hidePassword ? Palette.grey : Palette.green,
                  size: 20,
                ),
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter Password' : null;
            },
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }

  Form additionalDetailsForm() {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MultiSelectDialogField(
            items: categories.map((e) => MultiSelectItem(e, e)).toList(),
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
              selectedCategories = results;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _rate,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: kTextFieldDecoration.copyWith(
              label: Text(userrole == 'labourer' ? 'Rate/Hour' : 'Rate/Hour'),
              prefixIcon: const Icon(
                Icons.person,
                color: Palette.grey,
                size: 20,
              ),
            ),
            validator: (val) {
              return val!.isEmpty ? 'Please enter your Rate/Hour' : null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _about,
            maxLines: 8,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
                hintText: userrole == 'labourer'
                    ? 'Add some details about yourself here...'
                    : 'Add some details about your business here...'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _workExperience,
            maxLines: 8,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'Tell us about your work experience'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _membership,
            maxLines: 8,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'Do you have any special memberships'),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Form documentUploads() {
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          photoButton(
              label: 'Upload a photo of yourself (${profileImage.toString()})',
              docType: 'profileImage',
              count: profileImage),
          const SizedBox(height: 20),
          photoButton(
              label: 'Upload proof of residence (${addressImage.toString()})',
              docType: 'addressImage',
              count: addressImage),
          const SizedBox(height: 20),
          photoButton(
              label: 'Upload your ID (${idPassFile.toString()})',
              docType: 'idPassFile',
              count: idPassFile),
          const SizedBox(height: 20),
          photoButton(
              label: 'Upload your Passport (${passportphoto.toString()})',
              docType: 'passportphoto',
              count: passportphoto),
          const SizedBox(height: 20),
          photoButton(
              label: 'Upload your Work Permit (${workPermitFile.toString()})',
              docType: 'workPermitFile',
              count: workPermitFile),
          const SizedBox(height: 20),
          photoButton(
              label:
                  'Upload your Qualifications (${qualificationsFiles.length.toString()})',
              docType: 'qualificationsFile',
              count: qualificationsFiles.length),
          const SizedBox(height: 20),
          photoButton(
              label:
                  'Upload your Work Experience (${workExperienceFiles.length.toString()})',
              docType: 'workExperienceFile',
              count: workExperienceFiles.length),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    userrole = widget.userrole;

    setState(() => {
          if (userrole == 'customer') {steps = 1} else {steps = 3}
        });

    KeyboardVisibilityController().onChange.listen((isVisible) {
      if (isVisible) {
        if (mounted) {
          setState(() {
            keyboardOpen = true;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            keyboardOpen = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _mobileController.dispose();

    super.dispose();
  }

  Container photoButton(
      {required String label, required String docType, required int count}) {
    return Container(
        decoration: BoxDecoration(
          color: count == 0 ? Palette.orange : Palette.lightGreen,
          borderRadius: BorderRadius.circular(50),
        ),
        child: GestureDetector(
          onTap: () {
            pickImage(docType: docType);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: !keyboardOpen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        userrole == 'labourer'
                            ? 'Casual Employee'
                            : userrole == 'customer'
                                ? 'Casual Employer'
                                : 'SMME Business',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Step ${step.toString()} of ${steps.toString()}',
                        style: TextStyle(
                            color: Palette.green,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: step == 1
                        ? personalDetailsForm()
                        : step == 2
                            ? additionalDetailsForm()
                            : documentUploads(),
                  ),
                ),
              ),
              isLoading
                  ? spinLoader
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                          onTap: () {
                            if (step == 1) {
                              if (_registerFormKey.currentState!.validate()) {
                                submitForm1();
                              }
                            } else if (step == 2) {
                              if (_registerFormKey.currentState!.validate()) {
                                submitForm2();
                              }
                            } else if (step == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            }
                          },
                          child: greenButton(
                              label: step != steps ? 'Next' : 'Sign up')),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
