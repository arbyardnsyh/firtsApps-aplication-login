import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String namaLengkap;

  const WelcomePage({Key? key, required this.namaLengkap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hilangkan AppBar
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fotowelcome.jpeg'),
                fit: BoxFit.cover, // Agar gambar memenuhi layar
              ),
            ),
          ),

          // Text "The best app for your vacation" di kiri atas, vertikal
          Positioned(
            top: 100, // Posisi dari atas
            left: 20, // Posisi dari kiri
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The best',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'app for',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'your vacation',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Teks "Selamat Datang" di tengah layar
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Agar teks terlihat di atas gambar
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10), // Memberikan sedikit jarak antara teks
                Text(
                  namaLengkap,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white, // Warna teks nama pengguna
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Tombol Logout di kiri bawah
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0), // Jarak dari tepi
              child: TextButton(
                onPressed: () {
                  // Arahkan ke halaman login atau lainnya
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Warna teks tombol
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent, // Membuat latar belakang tombol transparan
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.white, width: 2), // Border putih jika ingin
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
