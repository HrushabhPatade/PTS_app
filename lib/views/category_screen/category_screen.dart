import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/views/category_screen/category_details.dart';
import 'package:pts_app/widgets_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            appBar: AppBar(
              title: categories.text.fontFamily(semibold).make(),
              // 10.heightBox,
            ),
            body: Container(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          categoriesImages[index],
                          height: 128,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        10.heightBox,
                        categoriesList[index]
                            .text
                            .color(darkFontGrey)
                            .align(TextAlign.center)
                            .make(),
                      ],
                    )
                        .box
                        .white
                        .rounded
                        .clip(Clip.antiAlias)
                        .outerShadowSm
                        .make()
                        .onTap(() {
                      Get.to(
                          () => CategoryDetails(title: categoriesList[index]));
                    });
                  }),
            )));
  }
}
