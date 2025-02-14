import 'package:flutter/material.dart';
import '../widget/map_widget.dart';










class ConsultaAgendada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Consulta Agendada")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "SUA CONSULTA FOI AGENDADA!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Quinta-feira, 14 de Abril\n10:00 horas",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 5),
                Text(
                  "Rua: São Paulo - AL",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            MapWidget(),
          ],
        ),
      ),
    );
  }
}





