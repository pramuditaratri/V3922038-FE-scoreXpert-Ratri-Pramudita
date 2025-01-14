class Riwayat {
  final int anggotaId;
  final int pengajuanId;
  final double dti;
  final String status;
  final String? catatan;

  Riwayat({
    required this.anggotaId,
    required this.pengajuanId,
    required this.dti,
    required this.status,
    this.catatan,
  });

  // Factory untuk membuat objek Riwayat dari JSON
  factory Riwayat.fromJson(Map<String, dynamic> json) {
    return Riwayat(
      anggotaId: json['anggota_id'],
      pengajuanId: json['pengajuan_id'],
      dti: json['dti']?.toDouble() ?? 0.0,
      status: json['status'],
      catatan: json['catatan'],
    );
  }

  // Metode untuk mengonversi objek Riwayat ke JSON
  Map<String, dynamic> toJson() {
    return {
      'anggota_id': anggotaId,
      'pengajuan_id': pengajuanId,
      'dti': dti,
      'status': status,
      'catatan': catatan,
    };
  }
}
