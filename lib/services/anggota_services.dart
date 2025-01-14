import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Model/anggota.dart';

class AnggotaService {
  final String _baseUrl = 'http://192.168.200.47:8000/api/anggota';

  Future<List<Anggota>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> responseBody = jsonDecode(response.body);
        List<Anggota> anggota = responseBody.map((json) => Anggota.fromJson(json)).toList();
        return anggota;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  // Menambahkan data baru ke API
  Future<void> postData(Map<String, dynamic> data) async {
    print("Data yang dikirim: $data"); // Debugging log
    try {
      // Memastikan foto KTP diubah menjadi format base64 yang valid
      String base64String = data['foto'] ?? '';
      if (base64String.isNotEmpty && !base64String.startsWith("data:image/jpeg;base64,")) {
        base64String = "data:image/jpeg;base64," + base64String;
      }
      data['foto'] = base64String;  // Memperbarui data dengan format base64 yang valid

      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      // Menangani response
      if (response.statusCode != 201) {
        print('Error: ${response.body}');  // Log response body untuk debug
        throw Exception('Failed to save anggota: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error posting data: $e');
      throw Exception('Failed to save anggota');
    }
  }

  // Mengupdate data berdasarkan ID
  Future<void> updateData(int id, Map<String, dynamic> data) async {
    try {
      // Memastikan foto KTP diubah menjadi format base64 yang valid
      String base64String = data['foto'] ?? '';
      if (base64String.isNotEmpty && !base64String.startsWith("data:image/jpeg;base64,")) {
        base64String = "data:image/jpeg;base64," + base64String;
      }
      data['foto'] = base64String;  // Memperbarui data dengan format base64 yang valid

      final response = await http.put(
        Uri.parse('$_baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update anggota: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error updating data: $e');
      throw Exception('Failed to update anggota');
    }
  }

  // Menghapus data berdasarkan ID
  Future<bool> deleteData(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$_baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Data berhasil dihapus');
        return true;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error deleting data: $e');
      return false;
    }
  }
}