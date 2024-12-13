import 'package:flutter/material.dart';
import 'package:untitled/Hospital/cadastroHospital.dart';
import 'package:untitled/db/Hospital_DAO.dart';
import '../db/DBHelper.dart';
import 'DetailHospital.dart';
import 'hospital.dart';

class HospitalLista extends StatefulWidget {

  @override
  State<HospitalLista> createState() => _HospitalListaState();
}

class _HospitalListaState extends State<HospitalLista> {
  List<Hospital> hospitais = [];

  @override
  void initState() {
    super.initState();
    loadData();
    DBHelper().getTableInfo();
  }

  loadData() async {
    hospitais = await HospitalDAO().listarHospitais();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 16,
            ),
            SizedBox(width: 8),
            Text('Leticia'),
            SizedBox(width: 50,),
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HospitalFormScreen(),
                ),
              );

            }, child: Text("ADD HOSPITAL")),
            Icon(Icons.add),
          ],
        ),

        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Escolha o Hospital',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Arapiraca-AL',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: hospitais.length,
                itemBuilder: (context, index) {
                  final hospital = hospitais[index];
                  return ListTile(
                    leading: Icon(
                      Icons.local_hospital,
                      color: Colors.blue,
                    ),
                    title:InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalDetalhes(hospital: hospitais[index]),
                          ),
                        );
                      },
                      child: Text(
                        hospital.nome,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

