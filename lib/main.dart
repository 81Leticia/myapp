import 'package:flutter/material.dart';
import 'package:myapp/pages/culsulta_agendada.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  Widget build(BuildContext contex) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConsultaAgendada(),
    );
  }
}








