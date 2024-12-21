import 'package:flutter/material.dart';
import 'package:myapp/domain/medico.dart';

class Apresentacaomed extends StatelessWidget {
  final Medico medico;  

  Apresentacaomed({required this.medico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medico.nome), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${medico.nome}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Text('Especialidade: ${medico.especialidade}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            Text('CRM: ${medico.crm}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            Text('E-mail: ${medico.email}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            Text('Telefone: ${medico.telefone}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Entrando em contato com o médico...')),
                );
              },
              child: Text('Entrar em contato'),
            ),
          ],
        ),
      ),
    );
  }
}
