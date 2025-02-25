import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/fichaPessoal.dart';
import 'package:myapp/domain/paciente.dart';
import 'package:myapp/db/fichaPessoal_dao.dart';

class Listagem extends StatefulWidget {
  const Listagem({super.key});

  @override
  State<Listagem> createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  final FichaPessoalDao fichaPessoalDao = FichaPessoalDao();

  Future<List<Paciente>> fichaPessoal() async {
    return await fichaPessoalDao.listarFichaPessoal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Pacientes Cadastrados",
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FichaPessoal()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<Paciente>>(
            future: fichaPessoal(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Ocorreu um erro inesperado!"),
                );
              } else {
                List<Paciente> fichaPessoalList = snapshot.data ?? [];
                if (fichaPessoalList.isEmpty) {
                  return const Center(
                    child: Text("Nenhum paciente cadastrado."),
                  );
                }

                return ListView.builder(
                  itemCount: fichaPessoalList.length,
                  itemBuilder: (context, i) {
                    final paciente = fichaPessoalList[i];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          paciente.nomeCompleto,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "CPF: ${paciente.cpf}\n"
                              "Data Nascimento: ${paciente.dataNascimento}\n"
                              "Sexo: ${paciente.sexoSelecionado}\n"
                              "Cartão SUS: ${paciente.cartaoSus}\n"
                              "Peso: ${paciente.peso}kg\n"
                              "Telefone: ${paciente.telefone}\n"
                              "Endereço: ${paciente.endereco}",
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
