import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'consts.dart';

class StandartFunction {
  static Widget inputAuthontification(
      {required String name,
      required String path,
      required TextEditingController controller,
      required double width}) {
    return SizedBox(
      width: width * 0.8,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            // padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.transparent,
              child: Image.asset(path),
            ),
          ),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Constants.whiteColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Constants.whiteColor)),
          fillColor: Constants.whiteColor,
          hintText: name,
          hintStyle: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  static errorMessege(BuildContext context, String text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );;
  }
}
