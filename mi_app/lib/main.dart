import 'package:flutter/material.dart';
import 'screens/login.dart';  
import 'screens/dashboard.dart';
import 'screens/perfil.dart';

// Paleta de colores
const Color cyanClaro = Color(0xFF63FFAC);
const Color cyanOscuro = Color(0xFF30CBA1);
const Color negro = Color(0xFF000000);
const Color gris = Color(0xFF666666);
const Color blanco = Colors.white;

void main() {
  runApp(ElMedicoApp());
}

class ElMedicoApp extends StatelessWidget {
  const ElMedicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Médico',
      theme: ThemeData(
        scaffoldBackgroundColor: blanco,
        primaryColor: cyanOscuro,
        colorScheme: ColorScheme.light(
          primary: cyanOscuro,
          secondary: cyanClaro,
          onPrimary: blanco,
          onSurface: negro,
        ),
      ),
      home: LoginPage(), 
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/perfil': (context) => PerfilPage(),
      },
    );
  }
}

