import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/screens/preview.dart';

class Picture extends StatelessWidget {
  final int id;
  final String url;
  final String photographer;
  final String colorCode;
  Picture({
    required this.id,
    required this.url,
    required this.photographer,
    required this.colorCode,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Preview(
              id: id,
              colorCode: colorCode,
              photographer: photographer,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 15.0,
              offset: Offset(0.0, 3.0),
              color: Color(0xff000000).withOpacity(0.26),
            )
          ],
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Text(
              'by $photographer',
              overflow: TextOverflow.fade,
              style: kNormalTextStyle.copyWith(
                color: Colors.grey[350],
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
        ),
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}
