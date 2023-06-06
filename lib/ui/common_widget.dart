import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../constant/Constant.dart';

const textStyleDetail = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14.0,
    color: AppConstant.viewAllGray87,
    decoration: TextDecoration.none);

Widget backButtonWidget(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      width: 37,
      height: 37,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
      margin: EdgeInsets.only(
          left: AppConstant.mediumPadding, top: AppConstant.largePadding * 2),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/ic_back.png",
                width: 21,
                height: 21,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
