import 'package:flutter/material.dart';
import 'package:myapp/db/DBHelper.dart';
import 'package:myapp/domain/cadastro_medicodao.dart';


class ListarMedicos extends StatefulWidget {
  @override
  _ListarMedicosState createState() => _ListarMedicosState();
}

class _ListarMedicosState extends State<ListarMedicos> {
  late Future<List<Map<String, dynamic>>> medicos;

  @override
  void initState() {
    super.initState();
    medicos = DBHelper().initDB().then((value) => DBHelper().listarMedicos()); // Chama o método de listagem
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Médicos'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add_alt_1),
            onPressed: () async {
              // Ação para adicionar médico
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroMedico()),
              );
              setState(() {
                medicos = DBHelper().initDB().then((value) => DBHelper().listarMedicos()); // Atualiza a lista de médicos
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final medico = snapshot.data![index];
              return ListTile(
                title: Text(medico['nome']),
                subtitle: Text(medico['especialidade']),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendário'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit_sharp), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Ficha'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_agenda_rounded), label: 'B'),
        ],
      ),
    );
  }
}
