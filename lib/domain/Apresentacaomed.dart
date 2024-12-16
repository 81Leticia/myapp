import 'package:flutter/material.dart';

class Apresentacaomed extends StatefulWidget {
  const Apresentacaomed({super.key});

  @override
  State<Apresentacaomed> createState() => _ApresentacaomedState();
}

class _ApresentacaomedState extends State<Apresentacaomed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          SizedBox(height: 10),
          Text(
            'Dr. Ricardo Ferreira',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Color(0xFF44A4D7),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Image.asset(
                "assets/doc.png",
                height: 145,
                width: 156,
              ),
              SizedBox(width: 20),
              Text(
                'Cardiovascular',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print('Agendar pressionado');
            },
            child: Text('Agendar'),
          ),
          SizedBox(height: 30),
          Text(
            'Número de Celular: (11) 91234-5678',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Email Secretaria: scdrh@hotmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Email: Drricardohosp@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Hospitais:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '• Regional\n• Nossa Senhora de Fátima\n• Chama',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Formação Acadêmica:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '• Medicina - Universidade XYZ\n• Especialização em Cardiologia - Hospital ABC',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Experiência Profissional:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '• 10 anos de experiência na área cardiovascular\n• Atendeu em mais de 2000 pacientes',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Horários de Atendimento:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '• Segunda a sexta: 9h - 17h\n• Sábado: 9h - 13h',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Sobre Mim:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Sou apaixonado por cuidar da saúde cardiovascular e acredito em uma abordagem centrada no paciente.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
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