class Anggota {
  final int? id;
  final String cifDebitur;
  final String namaLengkap;
  final DateTime? tanggalLahir;
  final String tempatLahir;
  final String jenisKelamin;
  final String namaIbuKandung;
  final String statusPerkawinan;
  final String noKtp;
  final String fotoKtp;
  final DateTime? tanggalKTPBerlaku;
  final String profesiSampingan;
  final int jumlahTanggungan;
  final String noTelepon;
  final String alamat;
  final String kodePos;
  final String provinsi;
  final String kotaKabupaten;
  final String kecamatan;
  final String kelurahan;
  final String statusTempatTinggal;
  final int lamaTinggal;
  final String telepon;
  final String fax;
  final String namaUsaha;
  final DateTime? tanggalMulai;
  final int jumlahKaryawan;
  final int jarakLokasiUsaha;
  final String statusTempatUsaha;
  final DateTime? tanggalBerlakuUsaha;
  final String SiupNo;
  final String alamatUsaha;
  final String kodePosUsaha;
  final  String provinsiUsaha;
  final String kotaKabupatenUsaha;
  final String kecamatanUsaha;
  final String kelurahanUsaha;
 
  Anggota({
    this.id,
    required this.cifDebitur,
    required this.namaLengkap,
    this.tanggalLahir,
    required this.tempatLahir,
    required this.jenisKelamin,
    required this.namaIbuKandung,
    required this.statusPerkawinan,
    required this.noKtp,
    required this.fotoKtp,
    this.tanggalKTPBerlaku,
    required this.profesiSampingan,
    required this.jumlahTanggungan,
    required this.noTelepon,
    required this.alamat,
    required this.kodePos,
    required this.provinsi,
    required this.kotaKabupaten,
    required this.kecamatan,
    required this.kelurahan,
    required this.statusTempatTinggal,
    required this.lamaTinggal,
    required this.telepon,
    required this.fax,
    required this.namaUsaha,
    this.tanggalMulai,
    required this.jumlahKaryawan,
    required this.jarakLokasiUsaha,
    required this.statusTempatUsaha,
    this.tanggalBerlakuUsaha,
    required this.SiupNo,
    required this.alamatUsaha,
    required this.kodePosUsaha,
    required this.provinsiUsaha,
    required this.kotaKabupatenUsaha,
    required this.kecamatanUsaha,
    required this.kelurahanUsaha

  });

  // Convert from JSON
  factory Anggota.fromJson(Map<String, dynamic> json) {
    return Anggota(
      cifDebitur: json['cif_debitur'],
      namaLengkap: json['nama_lengkap'],
      tanggalLahir: json['tanggal_lahir'] != null ? DateTime.parse(json['tanggal_lahir']) : null,
      tempatLahir: json['tempat_lahir'],
      jenisKelamin: json['jenis_kelamin'],
      namaIbuKandung: json['nama_ibu_kandung'],
      statusPerkawinan: json['status_perkawinan'],
      noKtp: json['no_ktp'],
      fotoKtp: json['foto_ktp'],
      tanggalKTPBerlaku: json['tanggal_ktp_berlaku']!= null ? DateTime.parse(json['tanggal_ktp_berlaku']) : null,
      profesiSampingan: json['profesi_sampingan'],
      jumlahTanggungan: json['jumlah_tanggungan'],
      noTelepon: json['no_telepon'],
      alamat: json['alamat'],
      kodePos: json['kode_pos'],
      provinsi: json['provinsi'],
      kotaKabupaten: json['kota_kabupaten'],
      kecamatan: json['kecamatan'],
      kelurahan: json['kelurahan'],
      statusTempatTinggal: json['status_tempat_tinggal'],
      lamaTinggal: json['lama_tinggal'],
      telepon: json['telepon'],
      fax: json['fax'],
      namaUsaha: json['nama_usaha'],
      tanggalMulai: json['tanggal_mulai'] != null ? DateTime.parse(json['tanggal_mulai']) : null,
      jumlahKaryawan: json['jumlah_karyawan'],
      jarakLokasiUsaha: json['jarak_lokasi_usaha'],
      statusTempatUsaha: json['status_tempat_usaha'],
      tanggalBerlakuUsaha: json['tanggal_berlaku_usaha'] != null ? DateTime.parse(json['tanggal_berlaku_usaha']) : null,
      SiupNo: json['siup_no'],
      alamatUsaha: json['alamat_usaha'],
      kodePosUsaha: json['kode_pos_usaha'],
      provinsiUsaha: json['provinsi_usaha'],
      kotaKabupatenUsaha: json['kota_kabupaten_usaha'],
      kecamatanUsaha: json['kecamatan_usaha'],
      kelurahanUsaha: json['kelurahan_usaha']
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'cif_debitur': cifDebitur,
      'nama_lengkap': namaLengkap,
      'tanggal_lahir': tanggalLahir?.toIso8601String(),
      'tempat_lahir': tempatLahir,
      'jenis_kelamin': jenisKelamin,
      'nama_ibu_kandung':namaIbuKandung,
      'status_perkawinan': statusPerkawinan,
      'no_ktp': noKtp,
      'foto_ktp': fotoKtp,
      'tanggal_ktp_berlaku':tanggalKTPBerlaku?.toIso8601String(),
      'profesi_sampingan':profesiSampingan,
      'jumlah_tanggungan': jumlahTanggungan,
      'no_telepon': noTelepon,
      'alamat': alamat,
      'kode_pos': kodePos,
      'provinsi': provinsi,
      'kota_kabupaten': kotaKabupaten,
      'kecamatan': kecamatan,
      'kelurahan': kelurahan,
      'status_tempat_tinggal': statusTempatTinggal,
      'lama_tinggal': lamaTinggal,
      'telepon':telepon,
      'fax':fax,
      'nama_usaha':namaUsaha,
      'tanggal_mulai':tanggalMulai?.toIso8601String(),
      'jumlah_karyawan':jumlahKaryawan,
      'jarak_lokasi_usaha':jarakLokasiUsaha,
      'status_tempat_usaha':statusTempatUsaha,
      'tanggal_berlaku usaha':tanggalBerlakuUsaha?.toIso8601String(),
      'siup_no':SiupNo,
      'alamat_usaha':alamatUsaha,
      'kode_pos_usaha':kodePosUsaha,
      'provinsi_usaha' : provinsiUsaha,
      'kota_kabupaten_usaha':kotaKabupatenUsaha,
      'kecamatan_usaha':kecamatanUsaha,
      'kelurahan_usaha':kelurahanUsaha
    };
  }
}
