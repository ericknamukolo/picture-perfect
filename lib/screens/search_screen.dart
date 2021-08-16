import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/widgets/picture.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final String searchedName;
  SearchScreen({required this.searchedName});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  var _isLoading = false;
  var _isLoadingMore = false;
  int _loadMore = 20;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Wallpaper>(context, listen: false)
          .getCategoryWallpapers(widget.searchedName, _loadMore);
      setState(() {
        _isLoading = false;
      });
    });

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _isLoadingMore = true;
        });
        _loadMore += 20;
        await Provider.of<Wallpaper>(context, listen: false)
            .getCategoryWallpapers(widget.searchedName, _loadMore);
        setState(() {
          _isLoadingMore = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final fetchedPictures = Provider.of<Wallpaper>(context);
    return Scaffold(
      floatingActionButton: _isLoadingMore
          ? CircleAvatar(
              maxRadius: 20,
              backgroundColor: Color(0xff212120),
              child: Container(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: Color(0xff01c5c4),
                  strokeWidth: 3,
                ),
              ),
            )
          : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
            icon: Icon(Icons.close),
          ),
        ],
        leading: Opacity(
          opacity: 0,
          child: Icon(Icons.nightlight),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    _isLoading
                        ? 'https://icons8.com/preloaders/preloaders/1495/Spinner-3.gif'
                        : fetchedPictures.wallpapers[2].imgUrl,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.srcOver,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  widget.searchedName.substring(0, 1).toUpperCase() +
                      widget.searchedName.substring(1).toLowerCase(),
                  style: kNormalTextStyle.copyWith(fontSize: 50),
                ),
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
                      colorCode: fetchedPictures.wallpapers[index].colorCode,
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
