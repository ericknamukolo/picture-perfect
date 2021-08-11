import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> fetch() async {
    await Provider.of<Wallpaper>(context, listen: false).getTrendingWallpers(1);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: Color(0xff01c5c4),
              size: 100.0,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Picture',
                  style: kNormalBoldTextStyle.copyWith(
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 4),
                Hero(
                  tag: 'perf',
                  child: Text(
                    'Perfect',
                    style: kNormalBoldTextStyle.copyWith(
                      color: Color(0xff01c5c4),
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
