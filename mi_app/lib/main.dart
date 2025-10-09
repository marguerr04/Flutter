import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/dashboard.dart';
import 'screens/perfil.dart';


// Paleta de colores definidas con compañero


const Color cyanClaro = Color(0xFF63FFAC);
const Color cyanOscuro = Color(0xFF30CBA1);
const Color negro = Color(0xFF000000);
const Color gris = Color(0xFF666666);
const Color blanco = Colors.white;




void main() {
  runApp(ElMedicoApp());
}

class ElMedicoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Médico',
      theme: ThemeData( scaffoldBackgroundColor: blanco, // fondo blanco del login
      primaryColor: cyanOscuro,
      colorScheme: ColorScheme.light(
      primary: cyanOscuro,
      secondary: cyanClaro,
      onPrimary: blanco, // texto sobre fondo cyan
      onSurface: negro)),
      home: LoginPage(),
      initialRoute: '/login',
      routes: {
        '/dashboard': (context) => DashboardPage(),
        '/perfil': (context) => PerfilPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pantalla de Login', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('Ir al Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
