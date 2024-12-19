import 'package:flutter/material.dart';
import 'package:myapp/db/DBHelper.dart';
import 'package:myapp/domain/Apresentacaomed.dart';
import 'package:myapp/domain/cadastro_medico.dart';
import 'package:myapp/domain/medico.dart';  // Importe a classe Medico

class ListarMedicos extends StatefulWidget {
  @override
  _ListarMedicosState createState() => _ListarMedicosState();
}

class _ListarMedicosState extends State<ListarMedicos> {
  late Future<List<Medico>> medicos;  // Alterado para List<Medico>

  @override
  void initState() {
    super.initState();
    // Agora, estamos carregando uma lista de Medicos, não mais Map
    medicos = DBHelper.instance.listarMedicos();  // Chama o método diretamente
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
              // Navega para a tela de cadastro de médicos
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroMedico()),
              );
              // Após voltar, recarregue a lista de médicos
              setState(() {
                medicos = DBHelper.instance.listarMedicos();  // Recarrega os médicos
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Medico>>(
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
              final medico = snapshot.data![index];  // Agora é um objeto Medico
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(medico.nome, style: TextStyle(fontWeight: FontWeight.bold)),  // Agora usando Medico
                  subtitle: Text(medico.especialidade),  // Agora usando Medico
                  onTap: () {
                    // Passa o Medico para a tela de apresentação
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Apresentacaomed(medico: medico),  // Passando o objeto Medico
                      ),
                    );
                  },
                ),
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
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Calendário'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.edit_sharp), label: 'Agenda'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Ficha'),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda_rounded), label: 'B'),
        ],
      ),
    );
  }
}
