import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:provider/provider.dart';

class Preview extends StatelessWidget {
  final int id;
  Preview({required this.id});
  @override
  Widget build(BuildContext context) {
    final picture = Provider.of<Wallpaper>(context, listen: false)
        .wallpapers
        .firstWhere((image) => image.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Picture',
              style: kNormalBoldTextStyle,
            ),
            SizedBox(width: 4),
            Text(
              'Perfect',
              style: kNormalBoldTextStyle.copyWith(
                color: Color(0xff01c5c4),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(picture.imgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
