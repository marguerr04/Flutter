import 'package:flutter/material.dart';
const Color cyanClaro = Color(0xFF63FFAC);
const Color cyanOscuro = Color(0xFF30CBA1);
const Color negro = Color(0xFF000000);
const Color gris = Color(0xFF666666);
const Color blanco = Colors.white;




class LoginPage extends StatelessWidget {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login VitaLog'),
        backgroundColor: blanco,
        foregroundColor: negro,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
          ),
        ),
      ),
    );
  }
}
