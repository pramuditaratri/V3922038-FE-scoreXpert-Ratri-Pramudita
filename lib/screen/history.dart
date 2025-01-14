import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> riwayatList = [];

  @override
  void initState() {
    super.initState();
    fetchRiwayatData();
  }

  Future<void> fetchRiwayatData() async {
    String? token = await getToken(); // Ambil token dari SharedPreferences

    if (token == null) {
      print('Token tidak ditemukan');
      return;
    }

    final response = await http.get(
      Uri.parse('http://192.168.200.47:8000/api/riwayat'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      setState(() {
        riwayatList = data.map((e) => e as Map<String, dynamic>).toList();
      });
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History Pengajuan')),
      body: riwayatList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: riwayatList.length,
              itemBuilder: (context, index) {
                var riwayat = riwayatList[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    title: Text('Pengajuan ID: ${riwayat['id']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DTI: ${riwayat['dti']}%'),
                        Text('Status: ${riwayat['status']}'),
                        if (riwayat['catatan'] != null)
                          Text('Catatan: ${riwayat['catatan']}'),
                        Text('Created At: ${riwayat['created_at']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
