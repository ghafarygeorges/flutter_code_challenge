import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// * Screen size

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

// * Colors

Color appBarBgColor = const Color(0xFF4FE3C1);

// * TextStyles

TextStyle appBarTitleTheme = TextStyle(
  color: Colors.white,
  fontSize: 22.sp,
  fontWeight: FontWeight.w500,
);

TextStyle articleListTitleTheme = TextStyle(
  color: Colors.black,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
);

TextStyle articleListAuthorTheme = TextStyle(
  color: Colors.grey[500],
  fontSize: 15.sp,
  fontWeight: FontWeight.w400,
);

TextStyle articleDetailsTitleTheme = TextStyle(
  color: Colors.black,
  fontSize: 24.sp,
  fontWeight: FontWeight.w700,
);

TextStyle articleDetailsAbstractTheme = TextStyle(
  color: Colors.black,
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
);

TextStyle articleDetailsAuthorTheme = TextStyle(
  color: Colors.grey[500],
  fontSize: 15.sp,
  fontWeight: FontWeight.w400,
);

TextStyle articleDetailsSectionTheme = TextStyle(
  color: Colors.white,
  fontSize: 15.sp,
  fontWeight: FontWeight.w500,
);

TextStyle articleDetailsContentTheme = TextStyle(
  color: Colors.black,
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
);

TextStyle textFieldTheme = TextStyle(
  color: Colors.black,
  fontSize: 18.sp,
  fontWeight: FontWeight.w600,
);

// * This file will also include some widgets that can be used all over the app

// * Sized Box Width

SizedBox sbW5 = SizedBox(
  width: 5.w,
);
SizedBox sbW10 = SizedBox(
  width: 10.w,
);

// * Sized Box Height
SizedBox sbH5 = SizedBox(
  height: 5.h,
);
SizedBox sbH10 = SizedBox(
  height: 10.h,
);
SizedBox sbH20 = SizedBox(
  height: 20.h,
);

// * Various reusable widgets

Widget chevronForwardGreyIcon = Icon(
  CupertinoIcons.chevron_forward,
  size: 20.sp,
  color: Colors.grey[700],
);

Widget circularLoader = const Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Color(0xFF4FE3C1)),
  ),
);
