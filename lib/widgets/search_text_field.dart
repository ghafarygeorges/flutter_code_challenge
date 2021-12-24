import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/theme_constants.dart' as theme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: TextField(
        autofocus: true,
        onChanged: (str) => onChanged(str),
        style: theme.textFieldTheme,
        cursorColor: Colors.black,
        decoration: const InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
