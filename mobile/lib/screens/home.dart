import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/UI/appbar.dart';
import 'package:mobile/UI/bot_button.dart';
import 'package:mobile/UI/custom_widgets/credit_score_widget.dart';
import 'package:mobile/UI/custom_widgets/home_widget.dart';
import 'package:mobile/UI/custom_widgets/insights_widget.dart';
import 'package:mobile/UI/custom_widgets/offers_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _widgets = [const HomeWidget(), const HomeWidget(), const CreditScoreWidget(), const InsightsWidget(),const OffersWidget()];
  int i =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(preferredSize: Size.fromHeight(70)),
      body: _widgets[i],
      floatingActionButton: const BotButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (int index){setState(() {
          i = index;
        });},
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
