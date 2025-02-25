import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:myapp/db/fichaPessoal_dao.dart';
import 'package:myapp/domain/paciente.dart';
import 'package:myapp/pages/cpf.dart';
import 'package:myapp/pages/listagem.dart';
import 'package:myapp/pages/map.dart';

class FichaPessoal extends StatefulWidget {
  const FichaPessoal({super.key});

  @override
  State<FichaPessoal> createState() => _FichaPessoalState();
}

class _FichaPessoalState extends State<FichaPessoal> {
  final TextEditingController nomeCompletoController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dataNascimentoController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController cartaoSusController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String? sexo;
  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            buildTextFormField(
              controller: nomeCompletoController,
              text: 'Nome Completo',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            buildTextFormField(
              controller: cpfController,
              text: 'CPF',
              keyboardType: TextInputType.number,
              inputFormatters: [
                CpfInputFormatter(),
              ],
            ),
            SizedBox(height: 10),
            buildTextFormField(
              controller: dataNascimentoController,
              text: 'Data de Nascimento',
              keyboardType: TextInputType.datetime,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.blue,
                ),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dataNascimentoController.text = dateFormat.format(pickedDate);
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            buildSexoField(),
            SizedBox(height: 10),
            buildTextFormField(
              controller: cartaoSusController,
              text: 'N° do Cartão do SUS',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            buildTextFormField(
              controller: pesoController,
              text: 'Peso',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            buildTextFormField(
              controller: telefoneController,
              text: 'Telefone',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            buildTextFormField(
              controller: enderecoController,
              text: 'Endereço',
              keyboardType: TextInputType.text,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.deepPurple,
                ),
                onPressed: () async {
                  String endereco = enderecoController.text;
                  if (endereco.isNotEmpty) {
                    List<Location> locations = await locationFromAddress(endereco);
                    if (locations.isNotEmpty) {
                      Location location = locations.first;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapPage(location: location)),
                      );
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: onPressed,
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String text,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters,
        validator: fieldValidator,
        decoration: buildInputDecoration(text, suffixIcon),
        cursorColor: Colors.blue,
      ),
    );
  }

  Widget buildSexoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sexo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Masculino',
              groupValue: sexo,
              onChanged: (value) {
                setState(() {
                  sexo = value;
                });
              },
            ),
            const Text('Masculino'),
            Radio<String>(
              value: 'Feminino',
              groupValue: sexo,
              onChanged: (value) {
                setState(() {
                  sexo = value;
                });
              },
            ),
            const Text('Feminino'),
          ],
        ),
      ],
    );
  }

  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    }
    return null;
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: const Text(
        'Ficha de Cadastro Pessoal',
        style: TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String name, Widget? suffixIcon) {
    return InputDecoration(
      labelText: name,
      floatingLabelStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Colors.blue,
        ),
      ),
      suffixIcon: suffixIcon,
    );
  }

  Future<void> onPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      String nomeCompleto = nomeCompletoController.text;
      String cpf = cpfController.text;
      String dataNascimento = dataNascimentoController.text;
      String sexoSelecionado = sexo ?? "Não informado";
      if (sexoSelecionado == "Não informado") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Por favor, selecione o sexo")),
        );
        return;
      }
      int? cartaoSus = int.tryParse(cartaoSusController.text);
      if (cartaoSus == null || cartaoSus == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
              "Por favor, insira um número válido para o Cartão SUS",
          ),
          ),
        );
        return;
      }
      int peso = int.tryParse(pesoController.text) ?? 0;
      String telefone  = telefoneController.text;
      String endereco = enderecoController.text;


      Paciente fichaPessoal = Paciente(
        nomeCompleto: nomeCompleto,
        cpf: cpf,
        dataNascimento: dataNascimento,
        sexoSelecionado: sexoSelecionado,
        cartaoSus: cartaoSus,
        peso: peso,
        telefone: telefone,
        endereco: endereco,
      );

      await FichaPessoalDao().salvarFichaPessoal(fichaPessoal);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Listagem();
          },
        ),
      );
    }
  }
}
