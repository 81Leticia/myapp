import 'package:flutter/material.dart';
import 'package:myapp/db/database1.dart';
import 'package:myapp/domain/DoctorCard.dart';
import 'package:myapp/domain/Apresentacaomed.dart';

class Tela13 extends StatefulWidget {
  const Tela13({super.key});

  @override
  State<Tela13> createState() => _Tela13State();
}


class _Tela13State extends State<Tela13> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Regional'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Encontre Seu Médico',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: Database.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = Database.doctors[index];
                  return DoctorCard(doctor.specialty, doctor.icon, onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Apresentacaomed();
                        },
                      ),
                    );
                  });
                },
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_sharp),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Ficha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda_rounded),
            label: 'B',
          ),
        ],
      ),
    );
  }
}