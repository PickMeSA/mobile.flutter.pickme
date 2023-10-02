import 'package:app/screens/register/register_personal_details.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 70),
                    child: Text(
                      'Register As',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterPersonalDetails(
                                        userrole: 'customer')));
                      },
                      child: greenButton(label: 'Casual Employer'))),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterPersonalDetails(
                                        userrole: 'labourer')));
                      },
                      child: greenButton(label: 'Casual Employee'))),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegisterPersonalDetails(
                                        userrole: 'business')));
                      },
                      child: greenButton(label: 'SMME Business'))),
            ],
          ),
        ),
      ),
    );
  }
}
