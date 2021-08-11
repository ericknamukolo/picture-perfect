import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  final String url;
  final String name;
  final int id;
  CategoryCard({required this.name, required this.url, required this.id});
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
        margin: EdgeInsets.only(
          left: 10,
          bottom: 15,
          right: 10,
        ),
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Center(
          child: Text(
            name,
            style:
                kNormalBoldTextStyle.copyWith(fontSize: 18, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
