import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp/db/DBHelper.dart';

class CadastroMedico extends StatefulWidget {
  @override
  _CadastroMedicoState createState() => _CadastroMedicoState();
}

class _CadastroMedicoState extends State<CadastroMedico> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _especialidadeController = TextEditingController();
  final TextEditingController _crmController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  final DBHelper _dbHelper = DBHelper.instance;

  void _salvarMedico() async {
    String nome = _nomeController.text;
    String especialidade = _especialidadeController.text;
    String crm = _crmController.text;
    String email = _emailController.text;
    String telefone = _telefoneController.text;

    if (nome.isEmpty || especialidade.isEmpty || crm.isEmpty || email.isEmpty || telefone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, preencha todos os campos")),
      );
      return;
    }

    try {
      Database db = await _dbHelper.database;
      await db.insert('medicos', {
        'nome': nome,
        'especialidade': especialidade,
        'crm': crm,
        'email': email,
        'telefone': telefone,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Médico cadastrado com sucesso!")),
      );

      _nomeController.clear();
      _especialidadeController.clear();
      _crmController.clear();
      _emailController.clear();
      _telefoneController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao cadastrar médico: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Médicos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Nome", _nomeController),
              _buildTextField("Especialidade", _especialidadeController),
              _buildTextField("CRM", _crmController),
              _buildTextField("E-mail", _emailController),
              _buildTextField("Telefone", _telefoneController),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _salvarMedico,
                  child: Text("Salvar Médico"),
                ),
              ),
            ],
          ),
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
