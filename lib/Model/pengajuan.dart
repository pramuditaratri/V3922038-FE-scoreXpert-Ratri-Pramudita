class Pengajuan {
  final int? id;
  final int? anggotaId;
  final String? penghasilan;
  final String? agunan;
  final String? besaranKredit;
  final String? alasanKredit;  // Menambahkan alasan kredit
  final String? jumlahHutang;
  final String? tanggalPengajuan; // Gunakan konvensi camelCase untuk variabel
  final String? tanggalMulai;
  final String? tanggalSelesai;
  final String? bebanPengeluaranBulanan;  // Menambahkan beban pengeluaran bulanan

  Pengajuan({
    this.id,
    this.anggotaId,
    this.penghasilan,
    this.agunan,
    this.besaranKredit,
    this.alasanKredit,
    this.jumlahHutang,
    this.tanggalPengajuan,
    this.tanggalMulai,
    this.tanggalSelesai,
    this.bebanPengeluaranBulanan,
  });

  // Fungsi factory untuk mengonversi dari JSON
  factory Pengajuan.fromJson(Map<String, dynamic> json) {
    return Pengajuan(
      id: json['id'] as int?,
      anggotaId: json['anggota_id'] as int?,  // Sesuaikan dengan field yang ada di backend Laravel
      penghasilan: json['penghasilan'] as String? ?? '-',
      agunan: json['agunan'] as String? ?? '-',
      besaranKredit: json['besaran_kredit'] as String? ?? '-',
      alasanKredit: json['alasan_kredit'] as String? ?? '-',  // Menyesuaikan alasan kredit
      jumlahHutang: json['jumlah_hutang']?.toString() ?? '0',
      tanggalPengajuan: json['tanggal_pengajuan'] as String? ?? '-',
      tanggalMulai: json['tanggal_mulai'] as String? ?? '-',
      tanggalSelesai: json['tanggal_selesai'] as String? ?? '-',
      bebanPengeluaranBulanan: json['beban_pengeluaran_bulanan'] as String? ?? '0',  // Menggunakan 0 jika null
    );
  }

  // Fungsi untuk mengonversi data ke format JSON
  Map<String, dynamic> toJson() {
    return {
      'anggota_id': anggotaId,
      'penghasilan': penghasilan,
      'agunan': agunan,
      'besaran_kredit': besaranKredit,
      'alasan_kredit': alasanKredit,
      'jumlah_hutang': jumlahHutang,
      'tanggal_pengajuan': tanggalPengajuan,
      'tanggal_mulai': tanggalMulai,
      'tanggal_selesai': tanggalSelesai,
      'beban_pengeluaran_bulanan': bebanPengeluaranBulanan,
    };
  }
}
