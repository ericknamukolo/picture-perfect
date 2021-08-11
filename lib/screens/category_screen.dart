import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/widgets/picture.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final int id;
  final String imgUrl;
  CategoryScreen({
    required this.categoryName,
    required this.id,
    required this.imgUrl,
  });

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Wallpaper>(context, listen: false)
          .getCategoryWallpapers(widget.categoryName);
      setState(() {
        _isLoading = false;
      });
    });
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(widget.imgUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.srcOver,
                  ),
                ),
              ),
              child: Center(
                child: Text(widget.categoryName,
                    style: kNormalTextStyle.copyWith(fontSize: 50)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: CircularProgressIndicator(
                      color: Color(0xff01c5c4),
                    ),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount:
                        Provider.of<Wallpaper>(context).wallpapers.length,
                    itemBuilder: (BuildContext context, int index) => Picture(
                      id: fetchedPictures.wallpapers[index].id,
                      url: fetchedPictures.wallpapers[index].imgUrl,
                      photographer:
                          fetchedPictures.wallpapers[index].photographer,
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
      ),
    );
  }
}
