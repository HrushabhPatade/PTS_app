import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/controllers/auth_controller.dart';
import 'package:pts_app/views/auth_screen/login_screen.dart';
import 'package:pts_app/views/home_screen/home.dart';
import 'package:pts_app/widgets_common/applogo_widget.dart';
import 'package:pts_app/widgets_common/bg_widget.dart';
import 'package:pts_app/widgets_common/custom_textfield.dart';
import 'package:pts_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

import '../home_screen/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.14).heightBox,
            applogoWidget(),
            20.heightBox,
            "SignUp".text.fontFamily(bold).black.size(30).make(),
            30.heightBox,
            Column(
              children: [
                customTextField(
                    hint: nameHint,
                    title: name,
                    controller: nameController,
                    isPass: false),
                customTextField(
                    hint: emailHint,
                    title: email,
                    controller: emailController,
                    isPass: false),
                customTextField(
                    hint: passwordHint,
                    title: password,
                    controller: passwordController,
                    isPass: true),
                customTextField(
                    hint: passwordHint,
                    title: retypePassword,
                    controller: passwordRetypeController,
                    isPass: true),
                5.heightBox,
                // ourButton().box.width(context.screenWidth - 50).make(),
                ourButton(
                  color: redColor,
                  title: signup,
                  textColor: whiteColor,
                  onPress: () async {
                    try {
                      await controller
                          .signupMethod(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) {
                        return controller.storeUserData(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        );
                      }).then((value) {
                        VxToast.show(context, msg: "Logged in successfully");
                        Get.offAll(() => const Home());
                      });
                    } catch (e) {
                      // auth.signOut();
                      VxToast.show(context, msg: e.toString());
                    }
                  },
                ).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: alreadyHaveAccount,
                    style: TextStyle(fontFamily: bold, color: fontGrey),
                  ),
                  TextSpan(
                    text: login,
                    style: TextStyle(fontFamily: bold, color: redColor),
                  )
                ])).onTap(() {
                  Get.back();
                }),
                // Align(
                //     alignment: Alignment.centerRight,
                //     child: TextButton(
                //         onPressed: () {}, child: forgetPass.text.make())),
              ],
            )
                .box
                .black
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
