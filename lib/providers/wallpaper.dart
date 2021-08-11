import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:picture_perfect/models/wallpaper.dart' as pic;
import 'package:picture_perfect/models/category.dart' as c;

var apiKey = '563492ad6f91700001000001a9c6f3785da64552b01662f281fd951e';

class Wallpaper with ChangeNotifier {
  List<pic.Wallpaper> _wallpapers = [];
  List<pic.Wallpaper> get wallpapers {
    return [..._wallpapers];
  }

  Future<void> getTrendingWallpers(int currentPage) async {
    var url =
        'https://api.pexels.com/v1/curated/?page=$currentPage&per_page=25';
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': apiKey,
    });
    var data = json.decode(response.body);
    final List<pic.Wallpaper> loadedPhotos = [];
    data['photos'].forEach(
      (photo) => {
        loadedPhotos.add(
          pic.Wallpaper(
            id: photo['id'],
            imgUrl: photo['src']['portrait'],
            photographer: photo['photographer'],
          ),
        ),
      },
    );
    _wallpapers = loadedPhotos;

    notifyListeners();
  }

  bool isDark = true;

  bool toggleTheme() {
    return isDark = !isDark;
  }

  //CATEGORIES.........................................
  List<c.Category> _categories = [
    c.Category(
        id: 1,
        name: 'Nature',
        imgUrl:
            'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 2,
        name: 'Abstract',
        imgUrl:
            'https://images.pexels.com/photos/2693208/pexels-photo-2693208.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 3,
        name: 'Anime',
        imgUrl:
            'https://images.pexels.com/photos/69378/pexels-photo-69378.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 4,
        name: 'Sports',
        imgUrl:
            'https://images.pexels.com/photos/46798/the-ball-stadion-football-the-pitch-46798.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 5,
        name: 'Animals',
        imgUrl:
            'https://images.pexels.com/photos/146083/pexels-photo-146083.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 6,
        name: 'Vehicles',
        imgUrl:
            'https://images.pexels.com/photos/6332411/pexels-photo-6332411.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 7,
        name: 'People',
        imgUrl:
            'https://images.pexels.com/photos/4262424/pexels-photo-4262424.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
    c.Category(
        id: 8,
        name: 'Tech',
        imgUrl:
            'https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200'),
  ];

  List<c.Category> get categories {
    return [..._categories];
  }

  List<pic.Wallpaper> _categoryWallpapers = [];
  List<pic.Wallpaper> get categoryWallpapers {
    return [..._categoryWallpapers];
  }

  Future<void> getCategoryWallpapers(String categoryName) async {
    var url =
        'https://api.pexels.com/v1/search?query=$categoryName&per_page=20';
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': apiKey,
    });
    var data = json.decode(response.body);
    final List<pic.Wallpaper> loadedPhotos = [];
    data['photos'].forEach(
      (photo) => {
        loadedPhotos.add(
          pic.Wallpaper(
            id: photo['id'],
            imgUrl: photo['src']['portrait'],
            photographer: photo['photographer'],
          ),
        ),
      },
    );
    _wallpapers = loadedPhotos;
    notifyListeners();
  }
}
