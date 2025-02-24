import 'package:flutter/material.dart';
import 'package:myapp/db/DBHelper.dart';
import 'package:myapp/api/DDD.dart';

class CadastroMedico extends StatefulWidget {
  @override
  State<CadastroMedico> createState() => _CadastroMedicoState();
}

class _CadastroMedicoState extends State<CadastroMedico> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController especialidadeController = TextEditingController();
  final TextEditingController crmController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController localizacaoController = TextEditingController();

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
            SizedBox(height: 15),
            TextField(
              controller: especialidadeController,
              decoration: InputDecoration(labelText: 'Especialidade'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: crmController,
              decoration: InputDecoration(labelText: 'CRM'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            SizedBox(height: 15),
            buildTextField(
              label: 'Telefone (com DDD)',
              controller: telefoneController,
              icon: Icons.phone,
              isNumeric: true,
              onChanged: (_) => buscarDDD(),
            ),
            SizedBox(height: 15),
            buildTextField(
              label: 'Localização',
              controller: localizacaoController,
              icon: Icons.location_on,
              enabled: false,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (nomeController.text.isNotEmpty &&
                    especialidadeController.text.isNotEmpty &&
                    crmController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    telefoneController.text.isNotEmpty) {
                  Map<String, dynamic> medicoData = {
                    'nome': nomeController.text,
                    'especialidade': especialidadeController.text,
                    'crm': crmController.text,
                    'email': emailController.text,
                    'telefone': telefoneController.text,
                    'cidade': localizacaoController.text.split(',').first.trim(),
                    'estado': localizacaoController.text.split(',').last.trim(),
                  };


                  await DBHelper.instance.insertMedico(medicoData);


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


  void buscarDDD() async {
    String telefone = telefoneController.text.trim();

    if (telefone.length >= 2) {
      String ddd = telefone.substring(0, 2);
      var resultado = await DddApiService.buscarLocalizacaoPorDDD(ddd);

      if (resultado != null) {
        setState(() {
          localizacaoController.text =
          '${resultado['cidade']}, ${resultado['estado']}';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('DDD inválido ou não encontrado')),
        );
      }
    }
  }


  Widget buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isNumeric = false,
    bool enabled = true,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      cursorColor: const Color(0xFF10397B),
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        floatingLabelStyle: const TextStyle(color: Color(0xFF10397B)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF10397B), width: 2),
        ),
      ),
    );
  }
}
