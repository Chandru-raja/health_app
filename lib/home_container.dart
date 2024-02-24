import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(this.title, this.widget, this.onClick, {super.key});

  final String title;
  final Widget widget;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(5),
          height: 180,
          decoration: BoxDecoration(
            color: Color(0XFFEEF2FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(7.0, 7, 5, 0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cabin(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.indigo),
                ),
              ),
              Center(
                child: Container(
                  child: widget,
                  decoration: BoxDecoration(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
