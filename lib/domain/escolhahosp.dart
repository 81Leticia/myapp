import 'package:flutter/material.dart';
import 'package:myapp/domain/encontreseumed.dart';
//import 'package:myapp/encontreseumed.dart';

import 'encontreseumed.dart';


class Escolhahosp extends StatefulWidget {
 const Escolhahosp({super.key});


 @override
 State<Escolhahosp> createState() => _EscolhahospState();
}


class _EscolhahospState extends State<Escolhahosp> {
 bool hospitalA = false;
 bool hospitalB = false;
 bool hospitalC = false;
 bool hospitalD = false;
 bool hospitalE = false;
 bool hospitalF = false;


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           SizedBox(height: 50),
           Text(
             "Maria Letícia",
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.w900,
               color: Colors.black,
             ),
           ),
           SizedBox(height: 20),
           Text(
             "Escolha o Hospital",
             style: TextStyle(
               color: Colors.black,
               fontSize: 24,
               fontWeight: FontWeight.w600,
             ),
           ),
           Text(
             "Arapiraca-Al",
             style: TextStyle(
               color: Colors.black38,
               fontSize: 24,
               fontWeight: FontWeight.w600,
             ),
           ),
           SizedBox(height: 20),
           Column(
             children: [
               _buildHospitalRow(
                 value: hospitalA,
                 label: "Hospital Regional",
                 fontSize: 15,
                 onChanged: (bool? value) {
                   setState(() {
                     hospitalA = value ?? false;
                   });
                 },
               ),
               _buildHospitalRow(
                 value: hospitalB,
                 label: "Hospital Chama",
                 fontSize: 15,
                 onChanged: (bool? value) {
                   setState(() {
                     hospitalB = value ?? false;
                   });
                 },
               ),
               _buildHospitalRow(
                 value: hospitalC,
                 label: "Hospital de Emergência",
                 fontSize: 15,
                 onChanged: (bool? value) {
                   setState(() {
                     hospitalC = value ?? false;
                   });
                 },
               ),
               _buildHospitalRow(
                 value: hospitalD,
                 label: "Procriança",
                 fontSize: 15,
                 onChanged: (bool? value) {
                   setState(() {
                     hospitalD = value ?? false;
                   });
                 },
               ),
               _buildHospitalRow(
                 value: hospitalE,
                 label: "Hospital DO Amor",
                 fontSize: 15,
                 onChanged: (bool? value) {
                   setState(() {
                     hospitalE = value ?? false;
                   });
                 },
               ),
               _buildHospitalRow(
                 value: hospitalF,
                 label: "Hospital Santa Fé",
                 fontSize: 15,
                 onChanged: (bool? value) {
                   setState(() {
                     hospitalF = value ?? false;
                   });
                 },
               ),
             ],
           ),
           SizedBox(height: 16,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Color(0xFF44A4D7),
                   side:
                   const BorderSide(color: Color(0xFF44A4D7), width: 2),


                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(14)),
                 ),
                 onPressed: () {
                   Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Encontreseumed();
                        },
                      ),
                    );
                 },
                 child: const Padding(
                   padding:
                   EdgeInsets.symmetric(vertical: 15, horizontal: 55.0),
                   child: Row(
                     children: [
                       Text(
                         'ADICIONAR',
                         style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w900,
                             color: Colors.white),








                       ),
                     ],
                   ) ,
                 ),
               ),
             ],
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


 Widget _buildHospitalRow({
   required bool value,
   required String label,
   double fontSize = 20,
   required void Function(bool?) onChanged,
 }) {
   return Row(
     children: [
       Checkbox(
         activeColor: Colors.blue,
         value: value,
         onChanged: onChanged,
       ),
       Text(
         label,
         style: TextStyle(
           color: Colors.black,
           fontSize: fontSize,
           fontWeight: FontWeight.w500,
         ),
       ),
     ],
   );
 }
}
