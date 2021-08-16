import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';

class BottomSheetCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function() click;
  BottomSheetCard(
      {required this.name, required this.icon, required this.click});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 75,
        width: 100,
        decoration: BoxDecoration(
          color: Color(0xff212120),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Spacer(),
            Text(
              name,
              style: kNormalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
