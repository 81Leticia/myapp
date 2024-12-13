import 'package:flutter/material.dart';
import 'package:untitled/db/Hospital_DAO.dart';
import '../db/DBHelper.dart';
import 'Hospital_Card.dart';
import 'hospital.dart';

class HospitalFormScreen extends StatefulWidget {
  @override
  _HospitalFormScreenState createState() => _HospitalFormScreenState();
}

class _HospitalFormScreenState extends State<HospitalFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _enderecoController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _cepController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _fotoUrlController = TextEditingController();

  Future<void> _saveHospital() async {
    if (_formKey.currentState!.validate()) {
      final hospital = Hospital(
        nome: _nomeController.text,
        endereco: _enderecoController.text,
        cidade: _cidadeController.text,
        cep: _cepController.text,
        telefone: _telefoneController.text,
        email: _emailController.text,
      );


      final Hosp = HospitalDAO();
      await Hosp.insertHospital(hospital);


      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Hospital salvo com sucesso!')));
      print("Tudo certo");

      _nomeController.clear();
      _enderecoController.clear();
      _cidadeController.clear();
      _cepController.clear();
      _telefoneController.clear();
      _emailController.clear();
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>  HospitalLista(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Hospital'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset("asset/hosp_Img.png"),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do Hospital'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do hospital.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o endereço.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cidadeController,
                decoration: InputDecoration(labelText: 'Cidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a cidade.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cepController,
                decoration: InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CEP.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o telefone.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor, insira um email válido.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fotoUrlController,
                decoration: InputDecoration(labelText: 'URL da Foto'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveHospital,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
