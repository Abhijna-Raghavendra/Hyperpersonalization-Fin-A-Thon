import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/chat');
        },
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFC4161C),
        child: const FaIcon(FontAwesomeIcons.robot),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        iconSize: 20.r,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: 'profile'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.wallet), label: 'payments'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.qrcode), label: 'scan'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gift), label: 'offers'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.lightbulb), label: 'insights'),
        ],
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFFC4161C),
      ),
    );
  }
}
