import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pts_app/consts/consts.dart';
import 'package:pts_app/consts/lists.dart';
import 'package:pts_app/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: darkFontGrey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline_outlined,
                  color: darkFontGrey,
                )),
          ]),
      body: Column(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VxSwiper.builder(
                    autoPlay: true,
                    height: 350,
                    itemCount: 3,
                    aspectRatio: 16 / 9,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imgP1,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    }),
                10.heightBox,
                title!.text
                    .size(25)
                    .fontFamily(semibold)
                    .color(darkFontGrey)
                    .make(),
                10.heightBox,
                VxRating(
                  onRatingUpdate: (value) {},
                  normalColor: textfieldGrey,
                  selectionColor: golden,
                  count: 5,
                  size: 25,
                  stepInt: true,
                ),
                10.heightBox,
                "\$55000".text.color(redColor).fontFamily(bold).size(18).make(),
                10.heightBox,
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Seller".text.white.fontFamily(semibold).make(),
                        5.heightBox,
                        "In House Brand"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      ],
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.message_rounded, color: darkFontGrey),
                    )
                  ],
                )
                    .box
                    .height(60)
                    .padding(EdgeInsets.symmetric(horizontal: 16))
                    .color(textfieldGrey)
                    .make(),
                20.heightBox,
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    //quantity
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity: ".text.color(textfieldGrey).make(),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove),
                            ),
                            "0"
                                .text
                                .size(16)
                                .color(darkFontGrey)
                                .fontFamily(bold)
                                .make(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                            10.widthBox,
                            "(0 available)".text.color(textfieldGrey).make(),
                          ],
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    //total
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total: ".text.color(textfieldGrey).make(),
                        ),
                        "\₹0.00"
                            .text
                            .color(redColor)
                            .size(16)
                            .fontFamily(bold)
                            .make(),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                  ],
                ).box.white.shadowSm.make(),

                // desc section
                10.heightBox,
                "Description"
                    .text
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .make(),
                10.heightBox,
                "Good Laptop".text.color(darkFontGrey).make(),
                10.heightBox,
                //buttons section
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      ItemDetailsButtonsList.length,
                      (index) => ListTile(
                            title: "${ItemDetailsButtonsList[index]}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(Icons.arrow_forward),
                          )),
                ),
                20.heightBox,
                "Products You May Like"
                    .text
                    .fontFamily(bold)
                    .size(16)
                    .color(darkFontGrey)
                    .make(),
                10.heightBox,
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          6,
                          (index) => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    Image.asset(imgFc2,
                                        width: 150, fit: BoxFit.cover),
                                    10.heightBox,
                                    "MacBook Pro"
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
                                  .padding(const EdgeInsets.all(8))
                                  .make()),
                    )),
              ],
            ),
          ),
        )),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ourButton(
            color: redColor,
            onPress: () {},
            textColor: whiteColor,
            title: "Add to Cart",
          ),
        )
      ]),
    );
  }
}
