import 'package:flutter/material.dart';
import '../domain/listarmedicos.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Regional',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:ListarMedicos(),
    );
  }
}