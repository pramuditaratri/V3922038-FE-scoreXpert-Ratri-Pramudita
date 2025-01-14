import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/pengajuan_services.dart';
import 'package:flutter_application_1/screen/widgets/text.form.global.dart';
import 'package:flutter_application_1/screen/widgets/button.global.dart';
import 'package:flutter_application_1/Model/pengajuan.dart';

class AddPengajuan extends StatefulWidget {
  final Pengajuan? pengajuan;
  final bool isUpdate;

  const AddPengajuan({super.key, this.pengajuan, this.isUpdate = false});

  @override
  _AddPengajuanState createState() => _AddPengajuanState();
}

class _AddPengajuanState extends State<AddPengajuan> {
  final _formKey = GlobalKey<FormState>();
  List<dynamic> _anggotaList = [];
  String? _selectedAnggota;
  final penghasilanController = TextEditingController();
  final bebanPengeluaranController = TextEditingController(); // Field baru
  final agunanController = TextEditingController();
  final besaranKreditController = TextEditingController();
  final alasanKreditController = TextEditingController(); // Field baru
  final jumlahHutangController = TextEditingController();
  final tanggalPengajuanController = TextEditingController();
  final tanggalMulaiController = TextEditingController();
  final tanggalSelesaiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchAnggota();

    if (widget.isUpdate && widget.pengajuan != null) {
      _selectedAnggota = widget.pengajuan!.anggotaId?.toString();
      penghasilanController.text = widget.pengajuan!.penghasilan?.toString() ?? '';
      bebanPengeluaranController.text = widget.pengajuan!.bebanPengeluaranBulanan?.toString() ?? '';
      agunanController.text = widget.pengajuan!.agunan ?? '';
      besaranKreditController.text = widget.pengajuan!.besaranKredit ?? '';
      alasanKreditController.text = widget.pengajuan!.alasanKredit ?? '';
      jumlahHutangController.text = widget.pengajuan!.jumlahHutang?.toString() ?? '';
      tanggalPengajuanController.text = widget.pengajuan!.tanggalPengajuan?.toString() ?? '';
      tanggalMulaiController.text = widget.pengajuan!.tanggalMulai?.toString() ?? '';
      tanggalSelesaiController.text = widget.pengajuan!.tanggalSelesai?.toString() ?? '';
    }
  }

  Future<void> _fetchAnggota() async {
    try {
      final anggota = await PengajuanService().getAnggota();
      setState(() {
        _anggotaList = anggota;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil data anggota')),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final int? anggotaId = _selectedAnggota != null ? int.tryParse(_selectedAnggota!) : null;
      if (anggotaId == null) {
        print("Error: anggotaId kosong.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Harap pilih anggota')),
        );
        return;
      }

      final pengajuanData = {
        'anggota_id': anggotaId,
        'penghasilan': penghasilanController.text,
        'beban_pengeluaran_bulanan': bebanPengeluaranController.text, // Field baru
        'agunan': agunanController.text,
        'besaran_kredit': besaranKreditController.text,
        'alasan_kredit': alasanKreditController.text, // Field baru
        'jumlah_hutang': jumlahHutangController.text,
        'tanggal_pengajuan': tanggalPengajuanController.text,
        'tanggal_mulai': tanggalMulaiController.text,
        'tanggal_selesai': tanggalSelesaiController.text,
      };

      print("Data Pengajuan: $pengajuanData");  // Debugging data yang dikirim

      try {
        if (widget.isUpdate && widget.pengajuan != null) {
          final int? idPengajuan = widget.pengajuan!.id;
          if (idPengajuan != null) {
            await PengajuanService().updatePengajuan(idPengajuan, pengajuanData);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Pengajuan berhasil diperbarui')),
            );
          } else {
            print("Error: ID Pengajuan kosong.");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('ID Pengajuan kosong')),
            );
          }
        } else {
          await PengajuanService().submitPengajuan(pengajuanData);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Pengajuan berhasil disubmit')),
          );
        }
        Navigator.pop(context, true);
      } catch (e) {
        print("Error saat mengirim: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan saat mengirim pengajuan')),
        );
      }
    }
  }

  @override
  void dispose() {
    penghasilanController.dispose();
    bebanPengeluaranController.dispose(); // Field baru
    agunanController.dispose();
    besaranKreditController.dispose();
    alasanKreditController.dispose(); // Field baru
    jumlahHutangController.dispose();
    tanggalPengajuanController.dispose();
    tanggalMulaiController.dispose();
    tanggalSelesaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? 'Update Pengajuan' : 'Tambah Pengajuan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedAnggota,
                  hint: Text('Pilih Anggota'),
                  items: _anggotaList.map<DropdownMenuItem<String>>((anggota) {
                    return DropdownMenuItem<String>(
                      value: anggota['id'].toString(),
                      child: Text(anggota['no_ktp'] ?? 'No KTP tidak tersedia'), // Menampilkan no_ktp // Menghindari null
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAnggota = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Harap pilih no ktp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormGlobal(
                  controller: penghasilanController,
                  text: 'Penghasilan',
                  icon: Icons.money,
                  textInputType: TextInputType.number,
                  obscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi penghasilan';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormGlobal(
                  controller: bebanPengeluaranController,
                  text: 'Beban Pengeluaran Bulanan', // Field baru
                  icon: Icons.account_balance_wallet,
                  textInputType: TextInputType.number,
                  obscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi beban pengeluaran bulanan';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormGlobal(
                  controller: agunanController,
                  text: 'Agunan',
                  icon: Icons.home,
                  textInputType: TextInputType.text,
                  obscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi agunan';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormGlobal(
                  controller: besaranKreditController,
                  text: 'Besaran Kredit',
                  icon: Icons.credit_card,
                  textInputType: TextInputType.number,
                  obscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi besaran kredit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormGlobal(
                  controller: alasanKreditController, // Field baru
                  text: 'Alasan Kredit',
                  icon: Icons.comment,
                  textInputType: TextInputType.text,
                  obscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi alasan kredit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormGlobal(
                  controller: jumlahHutangController,
                  text: 'Jumlah hutang',
                  icon: Icons.credit_card,
                  textInputType: TextInputType.number,
                  obscure: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harap isi jumlah hutang';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                 // Untuk tanggal pengajuan
                GestureDetector(
                  onTap: () async {
                    DateTime lastDate = DateTime.now().add(Duration(days: 365 * 5)); // 5 tahun ke depan
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: lastDate, // Batas tanggal terakhir
                    );
                    if (pickedDate != null) {
                     tanggalPengajuanController.text = pickedDate.toLocal().toString().split(' ')[0];
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormGlobal(
                      controller: tanggalPengajuanController,
                      text: 'Tanggal Pengajuan',
                      icon: Icons.calendar_today,
                      textInputType: TextInputType.datetime,
                      obscure: false,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                 // Untuk tanggal pengajuan
                GestureDetector(
                  onTap: () async {
                    DateTime lastDate = DateTime.now().add(Duration(days: 365 * 5)); // 5 tahun ke depan
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: lastDate, // Batas tanggal terakhir
                    );
                    if (pickedDate != null) {
                     tanggalMulaiController.text = pickedDate.toLocal().toString().split(' ')[0];
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormGlobal(
                      controller: tanggalMulaiController,
                      text: 'Tanggal Mulai',
                      icon: Icons.calendar_today,
                      textInputType: TextInputType.datetime,
                      obscure: false,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                 // Untuk tanggal pengajuan
                GestureDetector(
                  onTap: () async {
                    DateTime lastDate = DateTime.now().add(Duration(days: 365 * 5)); // 5 tahun ke depan
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: lastDate, // Batas tanggal terakhir
                    );
                    if (pickedDate != null) {
                      tanggalSelesaiController.text = pickedDate.toLocal().toString().split(' ')[0];
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormGlobal(
                      controller: tanggalSelesaiController,
                      text: 'Tanggal Pengajuan',
                      icon: Icons.calendar_today,
                      textInputType: TextInputType.datetime,
                      obscure: false,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                ButtonGlobal(
                  text: widget.isUpdate ? 'Update' : 'Submit',
                  onTap: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
