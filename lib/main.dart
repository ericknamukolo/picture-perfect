import 'package:flutter/material.dart';
import 'package:picture_perfect/providers/videos.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/screens/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

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
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData.dark(),
        home: LoadingScreen(),
      ),
    );
  }
}
