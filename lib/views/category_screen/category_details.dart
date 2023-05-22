import 'package:flutter/physics.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/views/category_screen/item_details.dart';
import 'package:pts_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title: title!.text.fontFamily(bold).white.make(),
            ),
            body: Container(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => "Laptops"
                              .text
                              .size(15)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .size(130, 120 / 2)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .make()),
                    )),
                20.heightBox,
                Expanded(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemBuilder: (Context, index) {
                        return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Image.asset(imgP1,
                                  width: 200, height: 150, fit: BoxFit.cover),
                              // const Spacer(),
                              "HP Laptop"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              10.heightBox,
                              "\₹68000"
                                  .text
                                  .color(redColor)
                                  .fontFamily(bold)
                                  .make(),
                            ])
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .rounded
                            // .outerShadowSm
                            .padding(const EdgeInsets.all(12))
                            .make()
                            .onTap(() {
                          Get.to(() => ItemDetails(title: "Laptop"));
                        });
                        // 10.heightBox;
                      }),
                )
              ]),
            )));
  }
}
