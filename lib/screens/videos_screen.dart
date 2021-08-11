import 'package:flutter/material.dart';
import 'package:picture_perfect/providers/videos.dart';
import 'package:provider/provider.dart';

class VideosScreen extends StatefulWidget {
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Videos>(context, listen: false).fetchVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello world'),
    );
  }
}
