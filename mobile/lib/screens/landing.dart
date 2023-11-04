import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter/services.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  String _mobileNumber = '';

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _mobileNumber = _mobileNumber.split('+')[1];
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {},
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child:
                    Image.asset('assets/images/logo_white.png', width: 100.h),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.h),
            child: Text(
              'Hi $_mobileNumber !',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 4.h),
            child: Text(
              'Enter MPIN',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 4.h),
            child: Text(
              'Please enter your 6 - digit MPIN Number',
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 30,
              ),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    activeColor: Colors.black,
                    selectedColor: Colors.black54,
                    inactiveColor: Colors.black,
                    errorBorderColor: const Color(0xFFC4161C)),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  if (v.length != 6 || v != "123456") {
                    errorController!.add(ErrorAnimationType
                        .shake); // Triggering error shake animation
                    setState(() => hasError = true);
                  } else {
                    setState(
                      () {
                        hasError = false;
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: Text(
              hasError ? "*Invalid MPIN" : "",
              style: const TextStyle(
                color: Color(0xFFC4161C),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: TextButton(
                  onPressed: () => snackBar("Forgot MPIN..."),
                  child: const Text(
                    "Forgot MPIN?",
                    style: TextStyle(
                      color: Color(0xFFC4161C),
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
