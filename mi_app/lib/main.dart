import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/perfil.dart';

void main() {
  runApp(ElMedicoApp());
}

class ElMedicoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Médico',
      theme: ThemeData(primarySwatch: Colors.teal),
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
