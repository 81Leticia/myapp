import 'package:flutter/material.dart';
import 'package:myapp/api/cnpj_api.dart';
import 'package:myapp/db/HospitalDAO.dart';
import 'package:myapp/db/DB_Helper.dart';
import 'package:myapp/domain/hospital.dart';
import 'package:myapp/domain/cnpj.dart';
import 'package:myapp/pages/HospitalCard.dart';

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
  final _cnpjController = TextEditingController(); // Campo CNPJ

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

      final hosp = HospitalDAO();
      try {
        await hosp.insertHospital(hospital);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Hospital salvo com sucesso!'))
        );

        _nomeController.clear();
        _enderecoController.clear();
        _cidadeController.clear();
        _cepController.clear();
        _telefoneController.clear();
        _emailController.clear();
        _fotoUrlController.clear();
        _cnpjController.clear();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HospitalLista(),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao salvar hospital: $e'))
        );
      }
    }
  }

  Future<void> onPressedCnpjButton() async {
    String cnpj = _cnpjController.text;
    try {
      Cnpj? cnpjData = await CnpjApi().findCnpj(cnpj);

      if (cnpjData != null) {
        _enderecoController.text = cnpjData.logradouro;
        _cidadeController.text = cnpjData.municipio;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('CNPJ não encontrado ou inválido.'))
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao buscar CNPJ: $e'))
      );
    }
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
              TextFormField(
                controller: _cnpjController, // Campo CNPJ
                decoration: InputDecoration(
                  labelText: 'CNPJ',
                  suffixIcon: IconButton(
                    onPressed: onPressedCnpjButton,
                    icon: const Icon(Icons.search),
                  ),
                ),
                cursorColor: const Color(0xFF10397B), // Cor do cursor
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CNPJ.';
                  }
                  return null;
                },
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
