import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    this.title = "Chat App",
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(25, 25),
                color: Colors.black.withOpacity(.1),
                blurRadius: 20.0,
                spreadRadius: 10.0)
          ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //arrow
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 30.0,
                ),
                onPressed: () {}),
            //text title
            Text(
              title,
              style: GoogleFonts.roboto(
                  fontSize: 22.0, fontWeight: FontWeight.normal),
            ),
            //menu
            IconButton(
                icon: Icon(
                  Icons.menu_sharp,
                  size: 30.0,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
