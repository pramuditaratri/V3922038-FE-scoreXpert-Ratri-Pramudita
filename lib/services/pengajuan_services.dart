import 'dart:convert';
import 'package:http/http.dart' as http;

class PengajuanService {
  final String baseUrl = 'http://192.168.200.47:8000/api';

  Future<List<dynamic>> getAnggota() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/anggota'));

      // Debugging untuk melihat status dan body respons
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Validasi respons
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body); // Decode JSON jika body tidak kosong
        } else {
          throw Exception('Response body is empty');
        }
      } else {
        throw Exception('Failed to load anggota: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Tangkap error untuk debugging
      print('Error in getAnggota: $e');
      throw Exception('Error fetching anggota data');
    }
  }
  Future<List<dynamic>> getPengajuan() async {
    final response = await http.get(Uri.parse('$baseUrl/pengajuan'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load pengajuan: ${response.reasonPhrase}');
    }
  }

  Future<void> submitPengajuan(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/pengajuan'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to submit pengajuan: ${response.reasonPhrase}');
    }
  }

  Future<void> updatePengajuan(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/pengajuan/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update pengajuan: ${response.reasonPhrase}');
    }
  }

  Future<bool> deletePengajuan(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/pengajuan/$id'));

    if (response.statusCode == 200) {
      return true; // Berhasil dihapus
    } else {
      throw Exception('Failed to delete pengajuan: ${response.reasonPhrase}');
    }
  }
}
