import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/widgets/bottom_sheet_card.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bot_toast/bot_toast.dart';

class BottomSheetFam extends StatelessWidget {
  final dynamic colorCode;
  final String photographer;
  final String photographerUrl;
  final String url;
  final int height;
  final int width;
  BottomSheetFam({
    required this.colorCode,
    required this.photographer,
    required this.url,
    required this.photographerUrl,
    required this.height,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    //loading snackbar
    void showSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color(0xff212120),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Downloading Picture',
                style: kNormalTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xff01c5c4),
                  strokeWidth: 2.0,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff212120),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.4),
                  offset: Offset(3.0, 0.0),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  'Picture by ',
                  style: kNormalTextStyle.copyWith(
                    color: Colors.grey[350],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      launch(photographerUrl);
                    },
                    child: Text(
                      photographer,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: kNormalTextStyle.copyWith(
                        color: Color(0xff01c5c4),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomSheetCard(
                name: 'Download',
                icon: Icons.download,
                click: () async {
                  Navigator.pop(context);
                  showSnackBar();
                  await ImageDownloader.downloadImage(
                    url,
                    destination: AndroidDestinationType.custom(
                        directory: 'Picture Perfect'),
                  );
                  print('download complete');
                  BotToast.showSimpleNotification(
                    title: 'Download Complete',
                    titleStyle: kNormalTextStyle,
                    duration: Duration(seconds: 3),
                    closeIcon: Icon(
                      Icons.done,
                      size: 20,
                      color: Colors.green[400],
                    ),
                  );
                },
              ),
              BottomSheetCard(
                name: 'Favorite',
                icon: Icons.favorite,
                click: () {
                  showSnackBar();
                },
              ),
              BottomSheetCard(
                name: 'Set',
                icon: Icons.photo,
                click: () {},
              ),
            ],
          ),
          Container(
            height: 80,
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff212120),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.photo_size_select_actual_outlined,
                  size: 40,
                ),
                Text(
                  '$height x $width',
                  style:
                      kNormalTextStyle.copyWith(fontSize: 20, letterSpacing: 1),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Developed By ',
                style: kNormalTextStyle.copyWith(
                  color: Colors.grey[350],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch(
                      'https://www.linkedin.com/in/erick-namukolo-a49482202/');
                },
                child: Text(
                  'Erick Namukolo',
                  style: kNormalTextStyle.copyWith(
                    color: Color(0xff01c5c4),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
