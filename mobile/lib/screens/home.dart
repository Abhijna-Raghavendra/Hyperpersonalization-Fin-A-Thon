import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/UI/appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static List _routes = ['/home','/home','/credit','/insights','/offers'];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(preferredSize: Size.fromHeight(70)),
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
        onTap: (int index){Navigator.pushReplacementNamed(context, HomeScreen._routes[index]);},
        iconSize: 20.r,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: 'profile'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.wallet), label: 'payments'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gaugeHigh), label: 'credit score', ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.lightbulb), label: 'insights'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gift), label: 'offers'),
        ],
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFFC4161C),
      ),
    );
  }
}
