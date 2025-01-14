import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/credit_scoring_service.dart';
import 'package:flutter_application_1/Model/riwayat.dart';
import 'package:flutter_application_1/screen/widgets/button.global.dart'; // Import service yang sudah dibuat

class RiwayatScreen extends StatefulWidget {
  @override
  _RiwayatScreenState createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _noKtpController = TextEditingController();
  final TextEditingController namaLengkapController = TextEditingController();
  int? _id; // Tambahkan variabel untuk menyimpan ID

  Future<void> _submitForm() async {
  if (_formKey.currentState!.validate()) {
    try {
      final riwayatService = RiwayatService();
      final id = await riwayatService.calculateDTI(
        _noKtpController.text, // Mengirim no_ktp
        namaLengkapController.text, // Mengirim nama_lengkap
      );

      setState(() {
        _id = id; // Simpan ID untuk digunakan nanti
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('DTI berhasil dihitung! ID: $id')),
      );
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}

   // Fungsi untuk mendownload PDF
  Future<void> _downloadPDF() async {
    if (_id != null) {
      try {
        final riwayatService = RiwayatService();
        await riwayatService.downloadRiwayat(_id.toString());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('PDF berhasil diunduh!')),
        );
      } catch (e) {
        debugPrint('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Silakan hitung DTI terlebih dahulu.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hitung DTI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _noKtpController,
                decoration: InputDecoration(
                  labelText: 'No. KTP',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No. KTP wajib diisi';
                  }
                  if (value.length != 16) {
                    return 'No. KTP harus 16 digit';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: namaLengkapController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                  return null; // Jika valid, return null
                },
              ),
              SizedBox(height: 16),
              ButtonGlobal(
                onTap: _submitForm,
                text: 'Hitung DTI',
              ),
              SizedBox(height: 20),
              ButtonGlobal(
                onTap:  _downloadPDF,
                text: 'Download PDF',
              ),
              if (_id != null) ...[
                SizedBox(height: 16),
                Text('ID Tersimpan: $_id', style: TextStyle(fontSize: 16)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

