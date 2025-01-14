class Pemohon {
  final String cifDebitur;
  final String namaLengkap;
  final DateTime tanggalLahir;
  final String tempatLahir;
  final String jenisKelamin;
  final String statusPerkawinan;
  final String noKtp;
  final String fotoKtp;
  final String? profesiSampingan;
  final String namaIbuKandung;
  final int? jumlahTanggungan;
  final DateTime tanggalKtpBerlaku;
  final String noTelepon;
  final String alamat;
  final String kodePos;
  final String provinsi;
  final String kotaKabupaten;
  final String kecamatan;
  final String kelurahan;
  final String? telepon;
  final String? fax;
  final String? statusTempatTinggal;
  final int? lamaTinggal;
  final String? namaUsaha;
  final DateTime? tanggalMulai;
  final int? jumlahKaryawan;
  final double? jarakLokasiUsaha;
  final String? statusTempatUsaha;
  final DateTime? tanggalBerlakuUsaha;
  final String? siupNo;
  final String alamatUsaha;
  final String kodePosUsaha;
  final String provinsiUsaha;
  final String kotaKabupatenUsaha;
  final String kecamatanUsaha;
  final String kelurahanUsaha;

  Pemohon({
    required this.cifDebitur,
    required this.namaLengkap,
    required this.tanggalLahir,
    required this.tempatLahir,
    required this.jenisKelamin,
    required this.statusPerkawinan,
    required this.noKtp,
    required this.fotoKtp,
    this.profesiSampingan,
    required this.namaIbuKandung,
    this.jumlahTanggungan,
    required this.tanggalKtpBerlaku,
    required this.noTelepon,
    required this.alamat,
    required this.kodePos,
    required this.provinsi,
    required this.kotaKabupaten,
    required this.kecamatan,
    required this.kelurahan,
    this.telepon,
    this.fax,
    this.statusTempatTinggal,
    this.lamaTinggal,
    this.namaUsaha,
    this.tanggalMulai,
    this.jumlahKaryawan,
    this.jarakLokasiUsaha,
    this.statusTempatUsaha,
    this.tanggalBerlakuUsaha,
    this.siupNo,
    required this.alamatUsaha,
    required this.kodePosUsaha,
    required this.provinsiUsaha,
    required this.kotaKabupatenUsaha,
    required this.kecamatanUsaha,
    required this.kelurahanUsaha,
  });

  // Mengonversi data JSON ke objek Pemohon
  factory Pemohon.fromJson(Map<String, dynamic> json) {
    return Pemohon(
      cifDebitur: json['cif_debitur'],
      namaLengkap: json['nama_lengkap'],
      tanggalLahir: DateTime.parse(json['tanggal_lahir']),
      tempatLahir: json['tempat_lahir'],
      jenisKelamin: json['jenis_kelamin'],
      statusPerkawinan: json['status_perkawinan'],
      noKtp: json['no_ktp'],
      fotoKtp: json['foto_ktp'],
      profesiSampingan: json['profesi_sampingan'],
      namaIbuKandung: json['nama_ibu_kandung'],
      jumlahTanggungan: json['jumlah_tanggungan'],
      tanggalKtpBerlaku: DateTime.parse(json['tanggal_ktp_berlaku']),
      noTelepon: json['no_telepon'],
      alamat: json['alamat'],
      kodePos: json['kode_pos'],
      provinsi: json['provinsi'],
      kotaKabupaten: json['kota_kabupaten'],
      kecamatan: json['kecamatan'],
      kelurahan: json['kelurahan'],
      telepon: json['telepon'],
      fax: json['fax'],
      statusTempatTinggal: json['status_tempat_tinggal'],
      lamaTinggal: json['lama_tinggal'],
      namaUsaha: json['nama_usaha'],
      tanggalMulai: json['tanggal_mulai'] != null ? DateTime.parse(json['tanggal_mulai']) : null,
      jumlahKaryawan: json['jumlah_karyawan'],
      jarakLokasiUsaha: json['jarak_lokasi_usaha'],
      statusTempatUsaha: json['status_tempat_usaha'],
      tanggalBerlakuUsaha: json['tanggal_berlaku_usaha'] != null ? DateTime.parse(json['tanggal_berlaku_usaha']) : null,
      siupNo: json['siup_no'],
      alamatUsaha: json['alamat_usaha'],
      kodePosUsaha: json['kode_pos_usaha'],
      provinsiUsaha: json['provinsi_usaha'],
      kotaKabupatenUsaha: json['kota_kabupaten_usaha'],
      kecamatanUsaha: json['kecamatan_usaha'],
      kelurahanUsaha: json['kelurahan_usaha'],
    );
  }

  // Mengonversi objek Pemohon menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'cif_debitur': cifDebitur,
      'nama_lengkap': namaLengkap,
      'tanggal_lahir': tanggalLahir.toIso8601String(),
      'tempat_lahir': tempatLahir,
      'jenis_kelamin': jenisKelamin,
      'status_perkawinan': statusPerkawinan,
      'no_ktp': noKtp,
      'foto_ktp': fotoKtp,
      'profesi_sampingan': profesiSampingan,
      'nama_ibu_kandung': namaIbuKandung,
      'jumlah_tanggungan': jumlahTanggungan,
      'tanggal_ktp_berlaku': tanggalKtpBerlaku.toIso8601String(),
      'no_telepon': noTelepon,
      'alamat': alamat,
      'kode_pos': kodePos,
      'provinsi': provinsi,
      'kota_kabupaten': kotaKabupaten,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'telepon': telepon,
      'fax': fax,
      'status_tempat_tinggal': statusTempatTinggal,
      'lama_tinggal': lamaTinggal,
      'nama_usaha': namaUsaha,
      'tanggal_mulai': tanggalMulai?.toIso8601String(),
      'jumlah_karyawan': jumlahKaryawan,
      'jarak_lokasi_usaha': jarakLokasiUsaha,
      'status_tempat_usaha': statusTempatUsaha,
      'tanggal_berlaku_usaha': tanggalBerlakuUsaha?.toIso8601String(),
      'siup_no': siupNo,
      'alamat_usaha': alamatUsaha,
      'kode_pos_usaha': kodePosUsaha,
      'provinsi_usaha': provinsiUsaha,
      'kota_kabupaten_usaha': kotaKabupatenUsaha,
      'kecamatan_usaha': kecamatanUsaha,
      'kelurahan_usaha': kelurahanUsaha,
    };
  }
}
