import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pts_app/consts/colors.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/views/auth_screen/login_screen.dart';
import 'package:pts_app/views/home_screen/home.dart';
import 'package:pts_app/widgets_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //routing
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //using getX
      // Get.to(() => const LoginScreen());
      // Get.to(() => const LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkFontGrey,
      body: Center(
          child: Column(children: [
        // Align(
        //     alignment: Alignment.topLeft,
        //     child: Image.asset(icSplashBg, width: 300)),
        350.heightBox,
        applogoWidget(),
        20.heightBox,
        appname.text.fontFamily(bold).size(22).white.make(),
      ])),
    );
  }
}
