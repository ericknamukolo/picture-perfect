import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/screens/category_screen.dart';

class AnotherCategoryCard extends StatelessWidget {
  final String name;
  final String url;
  final int id;
  AnotherCategoryCard(
      {required this.name, required this.url, required this.id});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              categoryName: name,
              id: id,
              imgUrl: url,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcOver,
            ),
          ),
        ),
        height: 110,
        width: double.infinity,
        child: Center(
          child: Text(
            name,
            style: kNormalBoldTextStyle.copyWith(
              letterSpacing: 2,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
