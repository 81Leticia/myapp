import 'package:flutter/material.dart';
import '../db/DBHelper.dart';
import 'hospital.dart';

class HospitalDetalhes extends StatefulWidget {
  final Hospital hospital;

  const HospitalDetalhes({required this.hospital});

  @override
  State<HospitalDetalhes> createState() => _HospitalDetalhesState();
}



class _HospitalDetalhesState extends State<HospitalDetalhes> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.hospital.nome}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32,),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("",
                "widget.hospital.fotoUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.hospital.nome,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Local: ${widget.hospital.cidade}, ${widget.hospital.endereco}, ${widget.hospital.cep}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('CONECTAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
