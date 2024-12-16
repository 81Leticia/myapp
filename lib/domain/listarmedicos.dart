import 'package:flutter/material.dart';
//import 'package:project/db/database_helper.dart';
//import 'package:project/db/cadastro_medicodao.dart';

import 'package:myapp/domain/cadastro_medicodao.dart';
import '../db/database_helper.dart';


class ListarMedicos extends StatefulWidget {
  @override
  _ListarMedicosState createState() => _ListarMedicosState();
}


class _ListarMedicosState extends State<ListarMedicos> {
  late Future<List<Map<String, dynamic>>> medicos;


  @override
  void initState() {
    super.initState();
    medicos = DatabaseHelper.instance.listarMedicos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital Regional'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add_alt_1, color: Color(0xFF44A4D7),),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroMedico()),
              );
              setState(() {
                medicos = DatabaseHelper.instance.listarMedicos();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: medicos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum médico cadastrado.'));
          }
          return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final medico = snapshot.data![index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, size: 50, color: Color(0xFF44A4D7)),
                    Text(medico['nome'], style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(medico['especialidade']),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

