import 'package:flutter/material.dart';
import 'package:myapp/domain/DetailPage.dart';
import 'package:myapp/domain/cadastro.dart';
import 'package:myapp/domain/login.dart';
import 'package:myapp/domain/main.dart';

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

    await Future.delayed(const Duration(seconds: 3));


    bool userStatus = await cadastro().getUser();


    if (userStatus) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DetailPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
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
