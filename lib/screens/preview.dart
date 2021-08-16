import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/providers/wallpaper.dart';
import 'package:picture_perfect/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

class Preview extends StatelessWidget {
  final int id;
  final String colorCode;
  final String photographer;
  Preview(
      {required this.id, required this.colorCode, required this.photographer});
  @override
  Widget build(BuildContext context) {
    final picture = Provider.of<Wallpaper>(context, listen: false)
        .wallpapers
        .firstWhere((image) => image.id == id);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(picture.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheetFam(
                      colorCode: colorCode,
                      photographer: photographer,
                      url: picture.originalUrl,
                      photographerUrl: picture.photographerUrl,
                      height: picture.height,
                      width: picture.width,
                    ),
                  );
                },
                child: Icon(
                  MdiIcons.chevronUp,
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
