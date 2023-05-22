import 'package:pts_app/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller, isPass}) {
  return Column(
    children: [
      title!.text.color(white).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        // controller: controller,
        decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
      15.heightBox,
    ],
  );
}
