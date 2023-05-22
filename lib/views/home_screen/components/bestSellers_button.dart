import 'package:pts_app/consts/consts.dart';

Widget bestSellers({img, String? title}) {
  return Row(
    children: [
      Image.asset(img, width: 60, fit: BoxFit.fill),
      10.widthBox,
      title!.text.fontFamily(semibold).black.make()
    ],
  )
      .box
      .width(200)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}
