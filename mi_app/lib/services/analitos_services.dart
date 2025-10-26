import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/analito_point.model.dart';

class AnalitosService {
  final String baseUrl = "http://localhost:3000";

  Future<List<AnalitoPoint>> fetchHistorial(int pacienteId, String nombre, {String? lastFetchTime}) 
  async {
    // CONSTRUIR URL
    final uri = Uri.parse("$baseUrl/analitos/historial/$pacienteId")
        .replace(queryParameters: {
          'nombre': nombre,
          if (lastFetchTime != null) 'lastFetchTime': lastFetchTime
        });

    print("🔍 === LLAMANDO ANALITOS SERVICE ===");
    print("🔗 URL: $uri");
    print("👤 pacienteId: $pacienteId");
    print("📊 nombre analito: $nombre");
    print("⏰ lastFetchTime: $lastFetchTime");

    try {
      // HACER LA PETICIÓN
      final response = await http.get(uri);
      
      print("📡 === RESPUESTA DEL BACKEND ===");
      print("✅ Status Code: ${response.statusCode}");
      print("📦 Body crudo: ${response.body}");
      print("🔠 Body length: ${response.body.length} caracteres");

      if (response.statusCode == 200) {
        // INTENTAR DECODIFICAR JSON
        try {
          List<dynamic> body = jsonDecode(response.body);
          print("🔄 JSON decodificado: ${body.length} elementos");
          
          if (body.isNotEmpty) {
            print("📊 Primer elemento: ${body[0]}");
          } else {
            print("⚠️  Array VACÍO - no hay datos");
          }
          
          // CONVERTIR A MODELOS DART
          final result = body.map((e) => AnalitoPoint.fromJson(e)).toList();
          print("🎯 Modelos Dart creados: ${result.length}");
          
          return result;
          
        } catch (jsonError) {
          print("❌ ERROR decodificando JSON: $jsonError");
          print("📄 Contenido que falló: ${response.body}");
          throw Exception("Error decodificando JSON: $jsonError");
        }
        
      } else {
        print("❌ ERROR HTTP: ${response.statusCode}");
        print("📄 Error body: ${response.body}");
        throw Exception("Error HTTP ${response.statusCode} al cargar historial de analito");
      }
      
    } catch (httpError) {
      print("❌ ERROR de conexión: $httpError");
      print("💡 Posible causa: Backend no corriendo, CORS, o red");
      rethrow;
    } finally {
      print("🔚 === FIN LLAMADA ANALITOS ===");
    }
  }
}