import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatefulWidget {
  final String title;
  VoidCallback onTap;
  MyAppBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  //signout
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //title
          Expanded(
            child:
                Text(widget.title, style: GoogleFonts.bebasNeue(fontSize: 54)),
          ),

          //search button
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[100]),
                child:
                    IconButton(onPressed: signOut, icon: Icon(Icons.logout))),
          ),
        ],
      ),
    );
  }
}
