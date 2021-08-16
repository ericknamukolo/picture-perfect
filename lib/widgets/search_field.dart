import 'package:flutter/material.dart';
import 'package:picture_perfect/constants.dart';
import 'package:picture_perfect/screens/search_screen.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    void submit() async {
      if (search.text.isEmpty) {
        return;
      }
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchScreen(
            searchedName: search.text,
          ),
        ),
      );
      search.clear();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        onSubmitted: (_) {
          submit();
        },
        controller: search,
        autofocus: false,
        style: kNormalTextStyle,
        autocorrect: true,
        cursorColor: Color(0xff01c5c4),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              submit();
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color: Color(0xff01c5c4),
            ),
          ),
          hintText: 'Search...',
          hintStyle: kNormalTextStyle,
          filled: true,
          fillColor: Color(0xff373A39),
          contentPadding: EdgeInsets.all(18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
