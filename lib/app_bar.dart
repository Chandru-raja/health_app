import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 160,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.network("imageUrl", scale: 1, fit: BoxFit.cover),
            ),
          ),
          title: Text(
            "Good Morning !!",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          subtitle: Text(
            "John",
            // "Maria Joseph Shelton",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Tooltip(
              message: "info",
              triggerMode: TooltipTriggerMode.tap,
              child: Icon(
                Icons.info_outline,
                //color: Colors.,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
