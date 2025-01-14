import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/Model/riwayat.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';


class RiwayatService {
  // URL API Laravel
  static const String apiUrl = 'http://192.168.200.47:8000/api';

  // Fungsi untuk mendapatkan token dari SharedPreferences
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  // Fungsi untuk menghitung skor kredit
Future<int> calculateDTI(String noKtp, String namaLengkap) async {
  final url = Uri.parse('$apiUrl/calculate-dti');
  final token = await getToken();

  if (token == null) {
    throw Exception('Token autentikasi tidak ditemukan. Silakan login kembali.');
  }

  print('Menghitung DTI dengan noKtp: $noKtp dan namaLengkap: $namaLengkap');
  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'no_ktp': noKtp,
        'nama_lengkap': namaLengkap, // Menambahkan nama lengkap
      }),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Ambil `id` dari respons
      final int id = data['id'];
      print('DTI berhasil dihitung. ID: $id');
      return id; // Kembalikan ID untuk digunakan dalam unduhan
    } else {
      throw Exception('Gagal menghitung DTI: ${response.body}');
    }
  } catch (e) {
    print('Kesalahan saat menghitung DTI: $e');
    throw Exception('Kesalahan menghitung DTI: $e');
  }
}


// Fungsi untuk meminta izin penyimpanan
 Future<bool> requestPermission() async {
  final permission = await Permission.storage.request(); 
  if (permission.isGranted) {
    print("Izin penyimpanan diberikan.");
    return true;
  } else {
    print("Izin penyimpanan ditolak.");
    
    // Jika izin ditolak, buka pengaturan aplikasi untuk meminta izin lagi
    if (await Permission.storage.isDenied) {
      openAppSettings(); // Membuka pengaturan aplikasi untuk memberikan izin
    }
    return false;
  }
}


  // Fungsi untuk mendownload riwayat approval
  Future<void> downloadRiwayat(String id) async {
    String? token = await getToken();

    if (token == null) {
      throw Exception('Token tidak ditemukan. Pastikan Anda sudah login.');
    }

    // Periksa izin penyimpanan
    bool permissionGranted = await requestPermission();
    if (!permissionGranted) {
      throw Exception('Akses penyimpanan diperlukan untuk mendownload file.');
    }

    try {
      final response = await http.get(
        Uri.parse('$apiUrl/generate-approval?id=$id'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/pdf',
        },
      );

      print('Content-Type: ${response.headers['content-type']}');
      print('Response Status: ${response.statusCode}');
      print('Response Headers: ${response.headers}');

      if (response.statusCode == 200) {
        // Simpan file PDF jika respons berhasil
        await saveFile('riwayat_$id.pdf', response.bodyBytes);
        print('Riwayat berhasil didownload.');
      } else {
        throw Exception(
            'Gagal mendownload riwayat. Kode: ${response.statusCode}, Pesan: ${response.body}');
      }
    } catch (e) {
      print('Error saat mendownload file: $e');
      throw Exception('Error saat mendownload file.');
    }
  }

  Future<void> saveFile(String filename, List<int> bytes) async {
    try {
      final directory = await getExternalStorageDirectory(); // Get the external storage directory
      final downloadsDirectory = Directory('${directory!.path}/Download'); // Path to the Downloads directory

      if (!await downloadsDirectory.exists()) {
        await downloadsDirectory.create(recursive: true); // Create the Downloads directory if it doesn't exist
      }

      final filePath = '${downloadsDirectory.path}/$filename';
      final file = File(filePath);

      await file.writeAsBytes(bytes);
      print('File berhasil disimpan di: $filePath');
    } catch (e) {
      print('Gagal menyimpan file: $e');
      throw Exception('Gagal menyimpan file.');
    }
  }
}

