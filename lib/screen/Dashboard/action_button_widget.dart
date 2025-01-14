import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/anggota_screen.dart';
import 'package:flutter_application_1/screen/riwayat_screen.dart';
import 'package:flutter_application_1/screen/pengajuan_screen.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Menentukan jumlah tombol per baris berdasarkan lebar layar
        int buttonCountPerRow = constraints.maxWidth > 600 ? 4 : 2;

        return GridView.count(
          crossAxisCount: buttonCountPerRow,
          shrinkWrap: true,
          childAspectRatio: 1.0,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            // Tombol Master Anggota
            _buildActionButton(
              Colors.blue,
              Icons.people,
              'Master Anggota',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnggotaScreen()),
                );
              },
            ),
            // Tombol Master Pengajuan
            _buildActionButton(
              Colors.green,
              Icons.attach_money,
              'Master Pengajuan',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PengajuanScreen()),
                );
              },
            ),
            // Tombol Scoring
            _buildActionButton(
              Colors.orange,
              Icons.analytics,
              'Scoring',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RiwayatScreen()),
                );
              },
            ),
            // Tombol More
          ],
        );
      },
    );
  }

  Widget _buildActionButton(Color color, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.7),
                  color,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 36),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
