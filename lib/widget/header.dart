

import 'package:flutter/material.dart';


class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;


  Header({required this.title});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.grey[300],
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(50);
}

