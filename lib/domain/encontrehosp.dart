import 'package:flutter/material.dart';
import 'package:myapp/domain/escolhahosp.dart';
//import 'package:myapp/escolhahosp.dart';

class Encontrehosp extends StatefulWidget {
  const Encontrehosp({super.key});

  @override
  State<Encontrehosp> createState() => _EncontrehospState();
}

class _EncontrehospState extends State<Encontrehosp> {
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
            const SizedBox(height: 10),
            const Text(
              'Primeiro encontre seu hospital',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '*Clique no ícone do Hospital ou aperte em enter;',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: () {
                // Ação ao clicar no ícone do hospital
              },
              icon: const Icon(
                Icons.local_hospital,
                color: Colors.black26,
                size: 140,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                side: const BorderSide(color: Color(0x197DB2), width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Escolhahosp();
                        },
                      ),
                    );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 43.0),
                child: Text(
                  'PROCURAR',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Calendário'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_sharp), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Ficha'),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda_rounded), label: 'B'),
        ],
      ),
    );
  }
}