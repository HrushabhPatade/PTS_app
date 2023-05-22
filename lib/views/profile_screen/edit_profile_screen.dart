import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/widgets_common/bg_widget.dart';
import 'package:pts_app/widgets_common/custom_textfield.dart';
import 'package:pts_app/widgets_common/our_button.dart';

import '../../consts/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imgProfile2,
                width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                  color: fontGrey,
                  onPress: () {},
                  textColor: whiteColor,
                  title: "Change"),
              Divider(),
              20.heightBox,
              customTextField(hint: nameHint, title: name, isPass: false),
              customTextField(
                  hint: passwordHint, title: password, isPass: true),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 60,
                child: ourButton(
                    color: fontGrey,
                    onPress: () {},
                    textColor: whiteColor,
                    title: "Save"),
              )
            ],
          )
              .box
              .white
              .shadowSm
              .padding(EdgeInsets.all(16))
              .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make()),
    );
  }
}
