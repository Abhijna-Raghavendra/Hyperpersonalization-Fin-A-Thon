import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.preferredSize}) : super(key: key);
  final preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding:  EdgeInsets.all(20.0),
          child:  FaIcon(FontAwesomeIcons.bars,size: 25, color: Colors.grey,),
        ),
        title: Column(
          children: [
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_white.png', height: 40,),
              ],
            ),
          ],      ),
    );
  }
}

