import 'package:flutter/material.dart';
import '../db/database_helper.dart';


class CadastroMedico extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController especialidadeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Médico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do Médico'),
            ),
            TextField(
              controller: especialidadeController,
              decoration: InputDecoration(labelText: 'Especialidade'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (nomeController.text.isNotEmpty && especialidadeController.text.isNotEmpty) {
                  await DatabaseHelper.instance.inserirMedico({
                    'nome': nomeController.text,
                    'especialidade': especialidadeController.text,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Médico cadastrado com sucesso!')),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
