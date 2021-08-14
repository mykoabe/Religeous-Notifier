import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hinttext,
      this.suffixicondata,
      this.icondata,
      required this.textEditingController})
      : super(key: key);
  final String hinttext;
  final Icon? icondata;
  final Icon? suffixicondata;
  TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: icondata,
          hintText: hinttext,
          suffix: suffixicondata,
          border: InputBorder.none,
          fillColor: Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }
}
