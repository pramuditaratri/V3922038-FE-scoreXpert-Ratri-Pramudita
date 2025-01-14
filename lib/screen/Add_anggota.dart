import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/widgets/text.form.global.dart';
import 'package:flutter_application_1/services/anggota_services.dart';
import 'package:flutter_application_1/screen/anggota_screen.dart';
import 'package:flutter_application_1/Model/anggota.dart';
import 'package:flutter_application_1/screen/widgets/button.global.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class AddAnggota extends StatefulWidget {
  final Anggota? anggota;
  final bool isUpdate;

  const AddAnggota({super.key, this.anggota, this.isUpdate = false});

  @override
  State<AddAnggota> createState() => _AddAnggotaState();
}

class _AddAnggotaState extends State<AddAnggota> {
  AnggotaService anggotaService = AnggotaService();
  String formatDate(DateTime? date) {
  if (date == null) return '';
  return DateFormat('yyyy-MM-dd').format(date); // Sesuaikan format jika perlu
} 
  File? _selectedImage;
  String? _base64Image;
  final cifDebiturController = TextEditingController();
  final namaLengkapController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final jenisKelaminController = TextEditingController();
  final namaIbuKandungController = TextEditingController();
  final statusPerkawinanController = TextEditingController();
  final noKtpController = TextEditingController();
  final tanggalKTPBerlakuController = TextEditingController();
  final jumlahTanggunganController = TextEditingController();
  final profesiSampinganController = TextEditingController();
  final noTeleponController = TextEditingController();
  final alamatController = TextEditingController();
  final kodePosController = TextEditingController();
  final provinsiController = TextEditingController();
  final kotaKabupatenController = TextEditingController();
  final kecamatanController = TextEditingController();
  final kelurahanController = TextEditingController();
  final statusTempatTinggalController = TextEditingController();
  final lamaTinggalController = TextEditingController();
  final teleponController = TextEditingController();
  final faxController = TextEditingController();
  final namaUsahaController = TextEditingController();
  final tanggalMulaiController = TextEditingController();
  final jumlahKaryawanController = TextEditingController();
  final jarakLokasiUsahaController = TextEditingController();
  final statusTempatUsahaController = TextEditingController();
  final tanggalBerlakuUsahaController = TextEditingController();
  final siupNoController = TextEditingController();
  final alamatUsahaController = TextEditingController();
  final kodePosUsahaController = TextEditingController();
  final provinsiUsahaController = TextEditingController();
  final kotaKabupatenUsahaController = TextEditingController();
  final kecamatanUsahaController = TextEditingController();
  final kelurahanUsahaController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    if (widget.isUpdate && widget.anggota != null) {
      cifDebiturController.text = widget.anggota!.cifDebitur;
      namaLengkapController.text = widget.anggota!.namaLengkap;
      tanggalLahirController.text = formatDate(widget.anggota!.tanggalLahir);
      tempatLahirController.text = widget.anggota!.tempatLahir;
      jenisKelaminController.text = widget.anggota!.jenisKelamin;
      namaIbuKandungController.text = widget.anggota!.namaIbuKandung;
      statusPerkawinanController.text = widget.anggota!.statusPerkawinan;
      noKtpController.text = widget.anggota!.noKtp;
      _base64Image = widget.anggota!.fotoKtp!;
      tanggalKTPBerlakuController.text = formatDate(widget.anggota!.tanggalKTPBerlaku);
      profesiSampinganController.text = widget.anggota!.profesiSampingan;
      jumlahTanggunganController.text = widget.anggota!.jumlahTanggungan.toString(); 
      noTeleponController.text = widget.anggota!.noTelepon;
      alamatController.text = widget.anggota!.alamat;
      kodePosController.text = widget.anggota!.kodePos;
      provinsiController.text = widget.anggota!.provinsi;
      kotaKabupatenController.text = widget.anggota!.kotaKabupaten;
      kecamatanController.text = widget.anggota!.kecamatan;
      kelurahanController.text = widget.anggota!.kelurahan;
      statusTempatTinggalController.text = widget.anggota!.statusTempatTinggal;
      lamaTinggalController.text = widget.anggota!.lamaTinggal.toString();
      teleponController.text = widget.anggota!.telepon;
      faxController.text = widget.anggota!.fax;
      namaUsahaController.text = widget.anggota!.namaUsaha;
      tanggalMulaiController.text = formatDate(widget.anggota!.tanggalMulai);
      jumlahKaryawanController.text = widget.anggota!.jumlahKaryawan.toString();
      jarakLokasiUsahaController.text = widget.anggota!.jarakLokasiUsaha.toString();
      statusTempatUsahaController.text = widget.anggota!.statusTempatUsaha;
      tanggalBerlakuUsahaController.text = formatDate(widget.anggota!.tanggalBerlakuUsaha);
      siupNoController.text = widget.anggota!.SiupNo;
      alamatUsahaController.text = widget.anggota!.alamatUsaha;
      kodePosUsahaController.text = widget.anggota!.kodePosUsaha;
      provinsiUsahaController.text = widget.anggota!.provinsiUsaha;
      kotaKabupatenUsahaController.text = widget.anggota!.kotaKabupatenUsaha;
      kecamatanUsahaController.text = widget.anggota!. kecamatanUsaha;
      kelurahanUsahaController.text = widget.anggota!.kelurahanUsaha;
    }
  }

  @override
  void dispose() {
    cifDebiturController.dispose();
    namaLengkapController.dispose();
    tanggalLahirController.dispose();
    tempatLahirController.dispose();
    jenisKelaminController .dispose();
    namaIbuKandungController.dispose();
    statusPerkawinanController.dispose();
    noKtpController.dispose();
    tanggalKTPBerlakuController.dispose();
    jumlahTanggunganController.dispose();
    noTeleponController.dispose();
    alamatController.dispose();
    kodePosController.dispose();
    provinsiController.dispose();
    kotaKabupatenController.dispose();
    kecamatanController.dispose();
    kelurahanController.dispose();
    statusTempatTinggalController.dispose();
    lamaTinggalController.dispose();
    teleponController.dispose();
    faxController.dispose();
    namaUsahaController.dispose();
    tanggalMulaiController.dispose();
    siupNoController.dispose();
    alamatUsahaController.dispose();
    kodePosUsahaController.dispose();
    provinsiUsahaController.dispose();
    kotaKabupatenUsahaController.dispose();
    kecamatanUsahaController.dispose();
    kelurahanUsahaController.dispose();
    super.dispose();
  }
  DateTime? parseDate(String dateString) {
  try {
    return DateTime.parse(dateString);
  } catch (e) {
    return null;
  }
}

  bool validateInput() {
  // Menampilkan semua nilai input untuk debugging
  print('Cif Debitur: ${cifDebiturController.text}');
  print('Nama Lengkap: ${namaLengkapController.text}');
  print('Tanggal Lahir: ${tanggalLahirController.text}');
  print('Tempat Lahir: ${tempatLahirController.text}');
  print('Jenis Kelamin: ${jenisKelaminController.text}');
  print('Status Perkawinan: ${statusPerkawinanController.text}');
  print('No KTP: ${noKtpController.text}');
  print('Jumlah Tanggungan: ${jumlahTanggunganController.text}');
  print('No Telepon: ${noTeleponController.text}');
  print('Alamat: ${alamatController.text}');
  print('Kode Pos: ${kodePosController.text}');
  print('Provinsi: ${provinsiController.text}');
  print('Kota Kab/Kabupaten: ${kotaKabupatenController.text}');
  print('Kecamatan: ${kecamatanController.text}');
  print('Kelurahan: ${kelurahanController.text}');
  print('Status Tempat Tinggal: ${statusTempatTinggalController.text}');
  print('Lama Tinggal: ${lamaTinggalController.text}');
  print('telepon : ${teleponController.text}');
 

  // Validasi input kosong
  if (cifDebiturController.text.trim().isEmpty ||
      namaLengkapController.text.trim().isEmpty ||
      tanggalLahirController.text.trim().isEmpty ||
      tempatLahirController.text.trim().isEmpty ||
      jenisKelaminController.text.trim().isEmpty ||
      namaIbuKandungController.text.trim().isEmpty ||
      statusPerkawinanController.text.trim().isEmpty ||
      noKtpController.text.trim().isEmpty ||
      _base64Image == null || _base64Image!.isEmpty ||  // Pastikan _base64Image diinisialisasi
      tanggalKTPBerlakuController.text.trim().isEmpty ||
      profesiSampinganController.text.trim().isEmpty ||
      jumlahTanggunganController.text.trim().isEmpty ||
      noTeleponController.text.trim().isEmpty ||
      alamatController.text.trim().isEmpty ||
      kodePosController.text.trim().isEmpty ||
      provinsiController.text.trim().isEmpty ||
      kotaKabupatenController.text.trim().isEmpty ||
      kecamatanController.text.trim().isEmpty ||
      kelurahanController.text.trim().isEmpty ||
      statusTempatTinggalController.text.trim().isEmpty ||
      lamaTinggalController.text.trim().isEmpty ||
      teleponController.text.trim().isEmpty ||
      faxController.text.trim().isEmpty ||
      namaUsahaController.text.trim().isEmpty ||
      tanggalMulaiController.text.trim().isEmpty ||
      jumlahKaryawanController.text.trim().isEmpty ||
      jarakLokasiUsahaController.text.trim().isEmpty ||
      statusTempatUsahaController.text.trim().isEmpty ||
      tanggalBerlakuUsahaController.text.trim().isEmpty ||
      siupNoController.text.trim().isEmpty ||
      alamatUsahaController.text.trim().isEmpty ||
      kodePosUsahaController.text.trim().isEmpty ||
      provinsiUsahaController.text.trim().isEmpty ||
      kotaKabupatenUsahaController.text.trim().isEmpty ||
      kecamatanUsahaController.text.trim().isEmpty ||
      kelurahanUsahaController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Semua field harus diisi')),
    );
    return false;
  }

  // Validasi No Telepon
  if (!RegExp(r'^\d{10,15}$').hasMatch(noTeleponController.text.trim())) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nomor telepon harus terdiri dari 10-15 digit angka')),
    );
    return false;
  }

  // Validasi No KTP
  if (!RegExp(r'^\d{16}$').hasMatch(noKtpController.text.trim())) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No KTP harus terdiri dari 16 digit angka')),
    );
    return false;
  }

  // Validasi Kode Pos
  if (!RegExp(r'^\d{5}$').hasMatch(kodePosController.text.trim())) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kode pos harus terdiri dari 5 digit angka')),
    );
    return false;
  }

  return true;
}

 Future<void> _pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    try {
      // Validasi format file
      final fileExtension = pickedFile.path.split('.').last.toLowerCase();
      if (!['jpg', 'jpeg', 'png'].contains(fileExtension)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Hanya gambar dengan format JPG, JPEG, atau PNG yang diperbolehkan.'),
        ));
        return; // Hentikan eksekusi jika format tidak valid
      }

      // Konversi file gambar ke objek File
      File imageFile = File(pickedFile.path);

      // Membaca gambar dan mengonversinya ke Base64
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64String = base64Encode(imageBytes);

      // Menambahkan prefix berdasarkan format file gambar
      String mimeType = 'image/$fileExtension'; // Misal: image/jpg, image/png
      String base64Image = 'data:$mimeType;base64,$base64String';

      // Simpan gambar dan Base64 dalam state
      setState(() {
        _selectedImage = imageFile;  // Simpan file gambar
        _base64Image = base64Image;  // Simpan hasil Base64 dengan prefix
      });

      // Debug: Menampilkan Base64 dalam log dengan memastikan diawali dengan 'data:image/jpeg;base64,'
      if (!base64Image.startsWith("data:image/jpeg;base64,")) {
        base64Image = "data:image/jpeg;base64," + base64String;
      }
      
      print("Base64 String: $base64Image");

    } catch (e) {
      // Tangani kesalahan saat membaca file
      print('Error saat memproses gambar: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Terjadi kesalahan saat memproses gambar: $e'),
      ));
    }
  } else {
    // Ketika tidak ada gambar yang dipilih
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Tidak ada gambar yang dipilih.'),
    ));
  }
}

void saveData() async {
  if (validateInput()) {
    try {
      // Siapkan data yang akan dikirim
      final anggotaData = {
        "cif_debitur": cifDebiturController.text,
        "nama_lengkap": namaLengkapController.text,
        "tanggal_lahir": tanggalLahirController.text, // Format YYYY-MM-DD
        "tempat_lahir": tempatLahirController.text,
        "jenis_kelamin": jenisKelaminController.text,
        "nama_ibu_kandung": namaIbuKandungController.text,
        "status_perkawinan": statusPerkawinanController.text,
        "no_ktp": noKtpController.text,
        "foto_ktp": _base64Image,
        "tanggal_ktp_berlaku":tanggalKTPBerlakuController.text,
        "profesi_sampingan": profesiSampinganController.text,
        "jumlah_tanggungan": int.tryParse(jumlahTanggunganController.text) ?? 0,
        "no_telepon": noTeleponController.text,
        "alamat": alamatController.text,
        "kode_pos": kodePosController.text,
        "provinsi": provinsiController.text,
        "kota_kabupaten": kotaKabupatenController.text,
        "kecamatan": kecamatanController.text,
        "kelurahan": kelurahanController.text,
        "status_tempat_tinggal": statusTempatTinggalController.text,
        "lama_tinggal": int.tryParse(lamaTinggalController.text) ?? 0,
        "fax": faxController.text,
        "telepon": teleponController.text,
        "nama_usaha": namaUsahaController.text,
        "tanggal_mulai": tanggalMulaiController.text,
        "jumlah_karyawan":int.tryParse(jumlahKaryawanController.text)?? 0,
        "jarak_lokasi_usaha": int.tryParse(jarakLokasiUsahaController.text)?? 0,
        "status_tempat_usaha": statusTempatUsahaController.text,
        "tanggal_berlaku_usaha": tanggalBerlakuUsahaController.text,
        "siup_no": siupNoController.text,
        "alamat_usaha" :alamatUsahaController.text,
        "kode_pos_usaha":kodePosUsahaController.text,
        "provinsi_usaha":provinsiUsahaController.text,
        "kota_kabupaten_usaha":kotaKabupatenUsahaController.text,
        "kecamatan_usaha":kecamatanUsahaController.text,
        "kelurahan_usaha":kelurahanUsahaController.text
      };

      // Debugging: Cek apakah ada field yang null atau kosong
      bool adaFieldKosong = false;

      anggotaData.forEach((key, value) {
        if (value == null || value.toString().trim().isEmpty) {
          print("Field '$key' bernilai null atau kosong!");
          adaFieldKosong = true;
        }
      });

      if (adaFieldKosong) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Harap lengkapi semua field yang wajib diisi')),
        );
        return;
      }

      // Debugging: Cetak isi request body ke console
      print("Data yang dikirim: ${anggotaData.toString()}");

      // Lanjutkan proses pengiriman data (update atau tambah)
      bool response = false;
      try {
        if (widget.isUpdate) {
          if (widget.anggota?.id != null) {
            final id = widget.anggota!.id!;
            await anggotaService.updateData(id, anggotaData);
            response = true;
          } else {
            response = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('ID anggota tidak valid atau tidak ditemukan')),
            );
          }
        } else {
          await anggotaService.postData(anggotaData);
          response = true;
        }
      } catch (e) {
        print('Error: $e');
        response = false;
      }

      if (response) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.isUpdate ? 'Data berhasil diperbarui' : 'Data berhasil ditambahkan')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.isUpdate ? 'Gagal memperbarui data' : 'Gagal menambahkan data')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Anggota'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double padding = screenWidth > 600 ? 32.0 : 16.0;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  TextFormGlobal(
  controller: cifDebiturController,
  text: 'Cif Debitur',
  icon: Icons.person,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Cif Debitur tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: namaLengkapController,
  text: 'Nama',
  icon: Icons.person,
  textInputType: TextInputType.name,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

GestureDetector(
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      tanggalLahirController.text = pickedDate.toLocal().toString().split(' ')[0];
    }
  },
  child: AbsorbPointer(
    child: TextFormGlobal(
      controller: tanggalLahirController,
      text: 'Tanggal Lahir',
      icon: Icons.calendar_today,
      textInputType: TextInputType.datetime,
      obscure: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tanggal Lahir tidak boleh kosong';
        }
        return null; // Jika valid, return null
      },
    ),
  ),
),
SizedBox(height: 20),

TextFormGlobal(
  controller: tempatLahirController,
  text: 'Tempat Lahir',
  icon: Icons.badge,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Tempat Lahir tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: jenisKelaminController,
  text: 'Jenis Kelamin',
  icon: Icons.badge,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Jenis Kelamin tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: namaIbuKandungController,
  text: 'Nama Ibu Kandung',
  icon: Icons.girl,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Nama ibu kandung tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: statusPerkawinanController,
  text: 'Status perkawinan',
  icon: Icons.home,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Status perkawinan tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: noKtpController,
  text: 'No Ktp',
  icon: Icons.work,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'No KTP tidak boleh kosong';
    } else if (value.length != 16) {
      return 'No KTP harus 16 digit';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

Column(
  children: [
    if (_selectedImage != null)
      Image.file(
        _selectedImage!,
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
    ElevatedButton(
  onPressed: () async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Pilih Sumber Gambar"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: Text("Kamera"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: Text("Galeri"),
          ),
        ],
      ),
    );
    
    if (source != null) {
      await _pickImage(source);
    }
  },
  child: Text("Unggah Foto KTP"),
),
if (_base64Image != null)
  Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Text(
      "Base64 String:\n${_base64Image}",
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 12),
    ),
  ),
  ],
),
SizedBox(height: 20),

GestureDetector(
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      tanggalKTPBerlakuController.text = pickedDate.toLocal().toString().split(' ')[0];
    }
  },
  child: AbsorbPointer(
    child: TextFormGlobal(
      controller: tanggalKTPBerlakuController,
      text: 'Tanggal KTP berlaku',
      icon: Icons.calendar_today,
      textInputType: TextInputType.datetime,
      obscure: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'tanggal ktp berlaku tidak boleh kosong';
        }
        return null; // Jika valid, return null
      },
    ),
  ),
),
SizedBox(height: 20),

TextFormGlobal(
  controller: profesiSampinganController,
  text: 'Profesi sampingan',
  icon: Icons.work,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Jenis Kelamin tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),
    
TextFormGlobal(
  controller: jumlahTanggunganController,
  text: 'Jumlah tanggungan',
  icon: Icons.home,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Jumlah tanggungan tidak boleh kosong';
    }
    if (int.tryParse(value) == null) {
      return 'Jumlah tanggungan harus berupa angka';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: noTeleponController,
  text: 'Nomor Telepon',
  icon: Icons.home,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Nomor Telepon tidak boleh kosong';
    }
    if (value.length < 10) {
      return 'Nomor Telepon tidak valid';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: alamatController,
  text: 'Alamat',
  icon: Icons.home,
  textInputType: TextInputType.streetAddress,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kodePosController,
  text: 'Kode Pos',
  icon: Icons.home,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Kode Pos tidak boleh kosong';
    }
    if (value.length != 5) {
      return 'Kode Pos tidak valid';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: provinsiController,
  text: 'Provinsi',
  icon: Icons.home,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Provinsi tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kotaKabupatenController,
  text: 'Kota/Kabupaten',
  icon: Icons.home,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Kota/Kabupaten tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kecamatanController,
  text: 'Kecamatan',
  icon: Icons.home,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Kecamatan tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kelurahanController,
  text: 'Kelurahan',
  icon: Icons.home,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Kelurahan tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: statusTempatTinggalController,
  text: 'Status tempat tinggal',
  icon: Icons.home,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Status tempat tinggal tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: lamaTinggalController,
  text: 'Lama tinggal',
  icon: Icons.calendar_month,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Lama tinggal tidak boleh kosong';
    }
    return null;
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: teleponController,
  text: 'Telepon',
  icon: Icons.phone,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'telepon tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: faxController,
  text: 'Fax',
  icon: Icons.fax,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'fax tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: namaUsahaController,
  text: 'Nama Usaha',
  icon: Icons.business_sharp,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'nama usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

GestureDetector(
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      tanggalMulaiController.text = pickedDate.toLocal().toString().split(' ')[0];
    }
  },
  child: AbsorbPointer(
    child: TextFormGlobal(
      controller: tanggalMulaiController,
      text: 'Tanggal mulai usaha',
      icon: Icons.calendar_today,
      textInputType: TextInputType.datetime,
      obscure: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tanggal mulai usaha tidak boleh kosong';
        }
        return null; // Jika valid, return null
      },
    ),
  ),
),
SizedBox(height: 20),

TextFormGlobal(
  controller: jumlahKaryawanController,
  text: 'Jumlah karyawan',
  icon: Icons.person_pin,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Jumlah karyawan tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: jarakLokasiUsahaController,
  text: 'Jarak lokasi usaha',
  icon: Icons.location_pin,
  textInputType: TextInputType.number,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'jarak lokasi usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: statusTempatUsahaController,
  text: 'status tempat usaha',
  icon: Icons.place_rounded,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'status tempat usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

GestureDetector(
  onTap: () async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
     tanggalBerlakuUsahaController.text = pickedDate.toLocal().toString().split(' ')[0];
    }
  },
  child: AbsorbPointer(
    child: TextFormGlobal(
      controller: tanggalBerlakuUsahaController,
      text: 'Tanggal Berlaku Usaha',
      icon: Icons.calendar_today,
      textInputType: TextInputType.datetime,
      obscure: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tanggal berlaku usaha tidak boleh kosong';
        }
        return null; // Jika valid, return null
      },
    ),
  ),
),
SizedBox(height: 20),

TextFormGlobal(
  controller: siupNoController,
  text: 'SIUP No',
  icon: Icons.numbers_rounded,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'SIUP No tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: alamatUsahaController,
  text: 'Alamat usaha',
  icon: Icons.add_to_home_screen_sharp,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'alamat usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kodePosUsahaController,
  text: 'Kode pos usaha',
  icon: Icons.code_off_rounded,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'kode pos usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: provinsiUsahaController,
  text: 'Provinsi usaha',
  icon: Icons.location_city_sharp,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'provinsi usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kotaKabupatenUsahaController,
  text: 'Kota/Kabupaten usaha',
  icon: Icons.location_city_outlined,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'kota/kabupaten usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kecamatanUsahaController,
  text: 'Kecamatan usaha',
  icon: Icons.location_city_outlined,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'kecamatan usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),

TextFormGlobal(
  controller: kelurahanUsahaController,
  text: 'Kabupaten usaha',
  icon: Icons.badge,
  textInputType: TextInputType.text,
  obscure: false,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'kabupaten usaha tidak boleh kosong';
    }
    return null; // Jika valid, return null
  },
),
SizedBox(height: 20),
                  // Ganti dengan ButtonGlobal
                  ButtonGlobal(
                    text: widget.isUpdate ? 'Update' : 'Submit',
                    onTap: saveData, // Menggunakan onTap untuk aksi ketika tombol ditekan
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
