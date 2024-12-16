import 'package:flutter/material.dart';
import 'package:myapp/domain/Apresentacaomed.dart';

class hom extends StatefulWidget {
  const hom({super.key});

  @override
  State<hom> createState() => _homState();
}

class _homState extends State<hom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'SaúdeApp',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF44A4D7),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(bottom: 28),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pesquisar médico',
                    icon: Icon(
                      Icons.perm_camera_mic_rounded,
                      color: Colors.black38,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Apresentacaomed();
                        },
                      ),
                    );
                print('Dr. João clicado!');
              },
              child: Text(
                'Dr. Ricardo Ferreira',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF44A4D7),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                 
                print('Dr. Devid Souza!');
              },
              child: Text(
                'Dr. Devid Souza',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF44A4D7),
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              ' Encontre seu médico',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black38,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/doc.png",
                  height: 200,
                  width: 200,
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendário'),
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
