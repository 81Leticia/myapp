import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:untitled/Hospital/cadastroHospital.dart';



class DetailPage extends StatefulWidget {
  const DetailPage({super.key});
  @override
  State<DetailPage> createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF44A4D7),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/usuario.png",
                  height: 280,
                  width: 230,
                ),
              ],
            ),
            Container(
              height: 500,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
              ),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF44A4D7),
                          side:
                          const BorderSide(color: Color(0xFF44A4D7), width: 2),

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60.0),
                          child:
                          Row(
                            children: [
                              Text(
                                'Adicionar Médico',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),

                              ),
                              Icon(Icons.keyboard_arrow_right_sharp, size: 30, color: Colors.white,),
                            ],
                          ) ,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF44A4D7),
                          side:
                          const BorderSide(color: Color(0xFF44A4D7), width: 2),

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60.0),
                          child: Row(
                            children: [
                              Text(
                                'Sou Paciente',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                              Icon(Icons.keyboard_arrow_right_sharp, size: 30, color: Colors.white,),
                            ],
                          ) ,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF44A4D7),
                          side:
                          const BorderSide(color: Color(0xFF44A4D7), width: 2),

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return HospitalFormScreen();
                            },
                            ),
                          );
                        },
                        child: const Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60.0),
                          child: Row(
                            children: [
                              Text(
                                'Adicionar Hospital',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ),
                              Icon(Icons.keyboard_arrow_right_sharp, size: 30, color: Colors.white,),
                            ],
                          ) ,
                        ),
                      ),
                    ],
                  ),
                ],
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}