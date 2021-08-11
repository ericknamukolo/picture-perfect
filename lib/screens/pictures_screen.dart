import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/widgets/categories_card.dart';
import 'package:picture_perfect/widgets/picture.dart';
import 'package:picture_perfect/widgets/search_field.dart';
import 'package:provider/provider.dart';

class PicturesScreen extends StatefulWidget {
  @override
  _PicturesScreenState createState() => _PicturesScreenState();
}

class _PicturesScreenState extends State<PicturesScreen> {
  int _currentPage = 2;
  final ScrollController _scrollController = ScrollController();
  Future<void> nextPage() async {
    await Provider.of<Wallpaper>(context, listen: false)
        .getTrendingWallpers(_currentPage++);
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        await nextPage().then((_) => _scrollController.animateTo(70,
            duration: Duration(seconds: 1), curve: Curves.easeIn));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fetchedPictures = Provider.of<Wallpaper>(context);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          SearchField(),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 10),
            child: Text(
              'Trending Categories',
              style: kNormalBoldTextStyle.copyWith(fontSize: 16),
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            height: 80,
            child: ListView.builder(
              itemBuilder: (context, index) => CategoryCard(
                name: fetchedPictures.categories[index].name,
                url: fetchedPictures.categories[index].imgUrl,
                id: fetchedPictures.categories[index].id,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: fetchedPictures.categories.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 20),
            child: Text(
              'Curated Photos',
              style: kNormalBoldTextStyle.copyWith(fontSize: 16),
            ),
            alignment: Alignment.centerLeft,
          ),
          StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: Provider.of<Wallpaper>(context).wallpapers.length,
            itemBuilder: (BuildContext context, int index) => Picture(
              id: fetchedPictures.wallpapers[index].id,
              url: fetchedPictures.wallpapers[index].imgUrl,
              photographer: fetchedPictures.wallpapers[index].photographer,
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(1, index.isEven ? 1.2 : 1.6),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
