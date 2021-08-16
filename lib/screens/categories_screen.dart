import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/widgets/another_category_card.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fetchedPictures = Provider.of<Wallpaper>(context);
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<Wallpaper>(context, listen: false)
                    .getTrendingWallpers(1);
              },
              icon: Icon(Icons.close)),
        ],
        leading: Opacity(
          opacity: 0,
          child: Icon(Icons.nightlight),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => AnotherCategoryCard(
          name: fetchedPictures.categories[index].name,
          url: fetchedPictures.categories[index].imgUrl,
          id: fetchedPictures.categories[index].id,
        ),
        itemCount: fetchedPictures.categories.length,
        shrinkWrap: true,
      ),
    );
  }
}
