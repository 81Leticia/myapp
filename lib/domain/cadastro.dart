import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/domain/user.dart';
import '../db/user_dao.dart';


class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  State<cadastro> createState() => _cadastroState();

  getUser() {}
}




class _cadastroState extends State<cadastro> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmSenhaController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF44A4D7),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xFF44A4D7),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Container(
                height: 600,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Criar uma conta',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 60),

                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo e-mail obrigatório.';
                            } else if (value.contains('@')) {
                              return null;
                            } else {
                              return 'Você precisa de um e-mail válido.';
                            }
                          },
                          cursorColor: const Color(0xFF7C4DFF),
                          decoration: buildInputDecoration(
                            'E-mail:',
                            Icons.mail_outline_outlined,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: senhaController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          validator: (value) {
                            if (value!.length >= 6) {
                              return null;
                            } else {
                              return 'Você precisa de uma senha válida.';
                            }
                          },
                          cursorColor: const Color(0xFF44A4D7),
                          decoration: buildInputDecoration(
                            'Senha:',
                            Icons.lock_outline,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          controller: confirmSenhaController,
                          validator: (value) {
                            String senha = senhaController.text;
                            if (value!.length < 6) {
                              return "Você precisa digitar uma senha válida!";
                            } else if (value != senha) {
                              return "As senhas precisam ser iguais!";
                            } else {
                              return null;
                            }
                          },
                          decoration: buildInputDecoration(
                            "Confirmação de Senha",
                            Icons.lock_outline,
                          ),
                          cursorColor: const Color(0xFF10397B),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: onPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF44A4D7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Cadastrar',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Já tem uma conta? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'Entre!',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                  color: Colors.blue,
                                  fontSize: 12,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildInputDecoration(String label, IconData iconData) {
    return InputDecoration(
      labelText: label,
      floatingLabelStyle: const TextStyle(
        color: Colors.black54,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black54,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black54,
        ),
      ),
    );
  }
  Future<void> onPressed() async {

    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      User user = User(email, senha);
      UserDao().saveUser(user);
      Navigator.pop(context);
    }
  }
}

