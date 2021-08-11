import 'package:flutter/foundation.dart';
import 'package:picture_perfect/models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var apiKey = '563492ad6f91700001000001a9c6f3785da64552b01662f281fd951e';

class Videos with ChangeNotifier {
  List<Video> _videos = [];

  List<Video> get videos {
    return [..._videos];
  }

  Future<void> fetchVideos() async {
    const url = 'https://api.pexels.com/v1/videos/popular/?page=1&per_page=10';
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': apiKey,
    });
    final List<Video> loadedVideos = [];
    var data = json.decode(response.body);
    data['videos'].forEach(
      (video) => {
        loadedVideos.add(
          Video(
            vidUrl: video['video_files'][2]['link'],
            id: video['video_files'][2]['id'],
          ),
        ),
      },
    );
  }
}
