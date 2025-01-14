import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/anggota.dart';
import 'package:flutter_application_1/screen/Add_anggota.dart';
import 'package:flutter_application_1/services/anggota_services.dart';
import 'package:flutter_application_1/utils/global.color.dart';

class AnggotaScreen extends StatefulWidget {
  const AnggotaScreen({super.key});

  @override
  State<AnggotaScreen> createState() => _AnggotaScreenState();
}

class _AnggotaScreenState extends State<AnggotaScreen> {
  List<Anggota> listAnggota = [];
  List<Anggota> filteredAnggota = []; // Data yang sudah difilter
  AnggotaService anggotaService = AnggotaService();
  bool isLoading = true; // State untuk loading
  String searchQuery = ""; // Variabel pencarian

  // Fungsi untuk mengambil data anggota
  Future<void> getData() async {
    try {
      List<Anggota> data = await anggotaService.getData();
      setState(() {
        listAnggota = data; // Update list anggota
        filteredAnggota = data; // Set initial filter to the full list
        isLoading = false; // Selesai loading
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false; // Pastikan loading selesai meskipun error
      });
    }
  }

  // Fungsi untuk melakukan pencarian berdasarkan nama
  void searchAnggota(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredAnggota = listAnggota; // Jika kosong, tampilkan semua
      } else {
        filteredAnggota = listAnggota.where((anggota) {
          return anggota.namaLengkap.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  // Fungsi untuk menghapus anggota
  Future<void> deleteData(int id) async {
    final success = await anggotaService.deleteData(id);
    if (success) {
      setState(() {
        listAnggota.removeWhere((anggota) => anggota.id == id);
        filteredAnggota.removeWhere((anggota) => anggota.id == id);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus anggota')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getData(); // Ambil data saat pertama kali dimuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.mainColor,
        title: Text(
          'Master Anggota',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Input pencarian
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Cari Anggota',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                searchAnggota(value); // Panggil fungsi pencarian saat teks berubah
              },
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                isLoading // Loading indicator
                    ? Center(child: CircularProgressIndicator())
                    : filteredAnggota.isEmpty
                        ? Center(child: Text('Tidak ada data anggota'))
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              final anggota = filteredAnggota[index];
                              return Card(
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(16),
                                  title: Text(
                                    anggota.namaLengkap,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('NIK: ${anggota.noKtp}'),
                                      Text(
                                          'Tanggal Lahir: ${anggota.tanggalLahir}'),
                                      Text('Alamat: ${anggota.alamat}'),
                                      Text('No telepon: ${anggota.noTelepon}'),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AddAnggota(
                                                isUpdate: true,
                                                anggota: anggota,
                                              ),
                                            ),
                                          ).then((value) {
                                            getData(); // Refresh data setelah kembali
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text('Hapus Anggota'),
                                              content: Text(
                                                  'Apakah Anda yakin ingin menghapus anggota ini?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Tutup dialog
                                                  },
                                                  child: Text('Batal'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    if (anggota.id != null) {
                                                      deleteData(anggota.id!);
                                                      Navigator.of(context)
                                                          .pop(); // Tutup dialog
                                                    } else {
                                                      print(
                                                          "ID anggota tidak valid.");
                                                    }
                                                  },
                                                  child: Text('Hapus'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: filteredAnggota.length,
                          ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    backgroundColor: GlobalColors.mainColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAnggota(),
                        ),
                      ).then((value) {
                        getData(); // Refresh data setelah tambah
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
