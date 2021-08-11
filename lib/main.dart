import 'package:flutter/material.dart';
import 'package:picture_perfect/providers/videos.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/screens/loading_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PicturePerfect());
}

class PicturePerfect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Wallpaper(),
        ),
        ChangeNotifierProvider(
          create: (context) => Videos(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: LoadingScreen(),
      ),
    );
  }
}
