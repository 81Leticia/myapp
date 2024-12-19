import 'package:flutter/material.dart';
import 'package:myapp/domain/medico.dart';

class Apresentacaomed extends StatelessWidget {
  final Medico medico;  // Recebe o objeto Medico

  // Construtor da classe, aceitando o objeto Medico
  Apresentacaomed({required this.medico});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medico.nome),  // Exibe o nome do médico
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome do Médico
            Text('Nome: ${medico.nome}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Especialidade do Médico
            Text('Especialidade: ${medico.especialidade}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            // CRM do Médico
            Text('CRM: ${medico.crm}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            // E-mail do Médico
            Text('E-mail: ${medico.email}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            // Telefone do Médico
            Text('Telefone: ${medico.telefone}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),

            // Botão para entrar em contato
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a funcionalidade para entrar em contato com o médico
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
