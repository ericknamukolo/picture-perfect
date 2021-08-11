import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        style: kNormalTextStyle,
        autocorrect: true,
        cursorColor: Color(0xff01c5c4),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
              color: Color(0xff01c5c4),
            ),
          ),
          hintText: 'Search...',
          hintStyle: kNormalTextStyle,
          filled: true,
          fillColor: Color(0xff373A39),
          contentPadding: EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
