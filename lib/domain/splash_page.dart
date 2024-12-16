import 'package:flutter/material.dart';
import 'package:myapp/DetailPage.dart';
import 'package:myapp/cadastro.dart';
import 'package:myapp/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  checkUserStatus() async {
    // Aguarda por 3 segundos para simular carregamento
    await Future.delayed(const Duration(seconds: 3));

    // Verifica status do usuário
    bool userStatus = await cadastro().getUser();

    // Navega para a tela correta com base no estado do usuário
    if (userStatus) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailPage(), // Tela principal
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const longin(), // Tela de login
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF44A4D7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'SaúdeAPP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
