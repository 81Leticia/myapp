import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/db/database.dart';
//import 'package:myapp/menu_page.dart';
//import 'package:myapp/encontrehosp.dart';
//import 'package:myapp/hom.dart';

class MenuPage extends StatefulWidget {
  const MenuPage( {super.key});

  @override
  State<MenuPage> createState() => _MenuState();
}

class _MenuState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Row(
                  children: [
                    SizedBox(width: 100),
                    Text(
                      'MedSoft',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  children: [
                    SizedBox(width: 40),
                    Text(
                      'Nome do paciente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 45),
                    Text(
                      'Ver seu perfil',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                ListView.builder(
                  itemCount: Database.menus.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Database.menus[index].icon,
                            size: 35,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(width: 18),
                          Text(
                            Database.menus[index].nome,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_sharp), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Ficha'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda_rounded), label: 'B'),
        ],
      ),
    );
  }
}
