import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/screens/credit_score.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/landing.dart';
import 'package:mobile/screens/chat.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
        designSize: const Size(412, 732),
        builder: (BuildContext context, child) => MaterialApp(
              theme: ThemeData(fontFamily: 'Montserrat'),
              routes: {
                '/': (context) => const LandingScreen(),
                '/home': (context) => const HomeScreen(),
                '/chat': (context) => const ChatScreen(),
                '/credit': (context) => const CreditScreen(),
              },
            )),
  );
}
