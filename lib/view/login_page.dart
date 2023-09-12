import 'package:appads/view/aluno_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color textColor = Color(0xFF979797);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset("assets/logotipo_firma.png"),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.white,
              maxLength: 30,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: textColor),
                filled: true,
                fillColor: Color(0xFF212C34),
                hintText: "Informe o email",
                hintStyle: TextStyle(
                  color: textColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(37),
                    borderSide: BorderSide.none),
              ),
            ),
            TextField(
              cursorColor: Colors.white,
              maxLength: 15,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: textColor),
                filled: true,
                fillColor: Color(0xFF212C34),
                hintText: "Informe a senha",
                hintStyle: TextStyle(
                  color: textColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(37),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            loginButton(context)
          ],
        ),
      ),
    );
  }
}

Widget loginButton(context) {
  return SizedBox(
    height: 40,
    width: MediaQuery.of(context).size.width * 0.9,
    child: ElevatedButton(
      style: TextButton.styleFrom(
          backgroundColor: Color(0xFFFF285B),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AlunoPage()));
      },
      child: Text(
        "Entrar",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}
