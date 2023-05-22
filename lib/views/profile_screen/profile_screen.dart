import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/controllers/auth_controller.dart';
import 'package:pts_app/views/profile_screen/edit_profile_screen.dart';
import 'package:pts_app/widgets_common/bg_widget.dart';
import 'package:pts_app/views/profile_screen/components/details_card.dart';

import '../auth_screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: black,
                ),
              ).onTap(() {
                Get.to(() => const EditProfileScreen());
              }),
              Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Hrushabh N. Patade".text.fontFamily(semibold).black.make(),
                      "phrushabh13@gmail.com".text.black.make(),
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                        color: black,
                      )),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).black.make())
                ],
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      count: "00",
                      title: "cart",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "25",
                      title: "wishlist",
                      width: context.screenWidth / 3.4),
                  detailsCard(
                      count: "115",
                      title: "orders",
                      width: context.screenWidth / 3.4),
                ],
              ),

              40.heightBox,

              //button

              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButton.length,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonIcon[index],
                      width: 22,
                    ),
                    title: profileButton[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .padding(EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make(),
            ],
          ),
        )),
      ),
    );
  }
}
