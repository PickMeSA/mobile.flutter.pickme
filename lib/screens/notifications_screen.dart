import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/constants.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          actions: [
            GestureDetector(
              child: SvgPicture.asset('assets/icons/more.svg'),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
