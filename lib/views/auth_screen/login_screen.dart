import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/controllers/auth_controller.dart';
import 'package:pts_app/views/auth_screen/signup_screen.dart';
import 'package:pts_app/views/home_screen/home.dart';
import 'package:pts_app/widgets_common/applogo_widget.dart';
import 'package:pts_app/widgets_common/bg_widget.dart';
import 'package:pts_app/widgets_common/custom_textfield.dart';
import 'package:pts_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.14).heightBox,
            applogoWidget(),
            20.heightBox,
            "Login".text.fontFamily(bold).black.size(30).make(),
            30.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: emailHint,
                      title: email,
                      isPass: false,
                      controller: controller.emailController),
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      isPass: true,
                      controller: controller.passwordController),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make())),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make(),
                  controller.isloading.value
                      ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(fontGrey),
                      )
                      : ourButton(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onPress: () async {

                            controller.isloading(true);  


                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: "Login Succesful");
                                Get.offAll(() => const Home());
                              }else{
                                controller.isloading(false);
                              }
                            });
                            // Get.to(() => const Home());
                          }).box.width(context.screenWidth - 50).make(),

                  5.heightBox,
                  create.text.color(fontGrey).make(),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth - 50).make(),
                  ourButton(
                      color: redColor,
                      title: signup,
                      textColor: whiteColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),

                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  10.heightBox,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                                backgroundColor: black,
                                radius: 20,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ))),
                      ))
                ],
              )
                  .box
                  .black
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            )
          ],
        ),
      ),
    ));
  }
}
