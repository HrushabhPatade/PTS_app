import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/widgets_common/home_buttons.dart';
import 'components/bestSellers_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          10.heightBox,
          "Perfect Telecom Solutions"
              .text
              .fontFamily(bold)
              .black
              .size(25)
              // .align(TextAlign.right)
              // .align(TextAlign.end)
              .make(),
          10.heightBox,
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      "Our Services"
                          .text
                          .fontFamily(semibold)
                          .black
                          .size(20)
                          // .align(TextAlign.right)
                          // .align(TextAlign.end)
                          .make(),
                      10.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 200,
                          enlargeCenterPage: true,
                          itemCount: serviceList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              serviceList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButtons(
                                  icon: index == 0 ? icBuy : icService,
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.5,
                                  title:
                                      index == 0 ? "Buy Product" : "Servicing",
                                )),
                      ),
                      10.heightBox,
                      "Products"
                          .text
                          .fontFamily(semibold)
                          .black
                          .size(20)
                          // .align(TextAlign.right)
                          // .align(TextAlign.end)
                          .make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => homeButtons(
                                  icon: index == 0
                                      ? icPrinter
                                      : index == 1
                                          ? icLapDesk
                                          : icKts,
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 3.5,
                                  title: index == 0
                                      ? "Printer"
                                      : index == 1
                                          ? "Laptops & Pc"
                                          : "Telecom & Fax",
                                )),
                      ),
                      15.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "Best Selling Products"
                            .text
                            .black
                            .size(22)
                            .fontFamily(semibold)
                            .make(),
                      ),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                3,
                                (index) => Column(
                                      children: [
                                        bestSellers(
                                            img: bsImages1[index],
                                            title: bsTitle1[index]),
                                        // 10.heightBox,
                                        // bestSellers(),
                                      ],
                                    ))),
                      ),
                      10.heightBox,
                      // 10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                3,
                                (index) => Column(
                                      children: [
                                        bestSellers(
                                            img: bsImages2[index],
                                            title: bsTitle2[index]),
                                        // 10.heightBox,
                                        // bestSellers(),
                                      ],
                                    ))),
                      ),

                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: darkFontGrey),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Future"
                                .text
                                .white
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      6,
                                      (index) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Image.asset(imgP1,
                                                    width: 150,
                                                    fit: BoxFit.cover),
                                                10.heightBox,
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
                                              .margin(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4))
                                              .rounded
                                              .padding(const EdgeInsets.all(8))
                                              .make()),
                                )),
                          ],
                        ),
                      ),
                      //all products
                      20.heightBox,
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 300,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Image.asset(imgP5,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover),
                                  const Spacer(),
                                  "MacBooks"
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
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .rounded
                                .padding(const EdgeInsets.all(12))
                                .make();
                          })
                    ],
                  ))),
        ],
      )),
    );
  }
}
