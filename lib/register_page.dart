import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmasiPasswordController =
      TextEditingController();

  // Variabel untuk mengontrol opacity
  double _opacityRegister = 1.0;
  double _opacityJoin = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 139,
          167), 
      body: Column(
        children: [
          // Gambar atas dengan sudut melengkung
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40.0), // Melengkung hanya di bagian bawah
            ),
            child: Container(
              width:
                  MediaQuery.of(context).size.width, // Lebar penuh sesuai layar
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/foto.jpeg'), // Gambar latar belakang
                  fit: BoxFit.cover, // Agar gambar menyesuaikan lebar
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    color: Colors.black
                        .withOpacity(0.3), // Overlay warna hitam transparan
                  ),
                  Positioned(
                    bottom: 80, // Mengatur posisi teks pertama 80 dari bawah
                    left: 20, // Mengatur posisi teks 20 dari kiri
                    child: GestureDetector(
                      onTap: _onRegisterTextTapped, // Tambahkan GestureDetector
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200), // Durasi animasi
                        opacity:
                            _opacityRegister, // Menggunakan variabel opacity
                        child: Text(
                          'Daftar Sekarang!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50, // Mengatur posisi teks kedua 50 dari bawah
                    left: 20,
                    child: GestureDetector(
                      onTap: _onJoinTextTapped, // Tambahkan GestureDetector
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 200), // Durasi animasi
                        opacity: _opacityJoin, // Menggunakan variabel opacity
                        child: Text(
                          'Bergabunglah dengan aplikasi kami',
                          style: TextStyle(
                            color: Colors.white, // Warna teks putih
                            fontSize: 18, // Ukuran font lebih kecil
                            fontWeight: FontWeight.w500, // Tebal sedang
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Jarak sebelum form

          // Card berisi form register
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              color: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Nama Lengkap TextFormField
                      TextFormField(
                        controller: _namaLengkapController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 32, 169, 193),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 16, 68, 77),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Masukkan nama lengkap Anda',
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama lengkap tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Email TextFormField
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 32, 169, 193),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 16, 68, 77),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Masukkan email Anda',
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email tidak boleh kosong';
                          } else if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}')
                              .hasMatch(value)) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Password TextFormField
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 32, 169, 193),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 16, 68, 77),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Masukkan password Anda',
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password tidak boleh kosong';
                          } else if (value.length < 8) {
                            return 'Password minimal 8 karakter';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Konfirmasi Password TextFormField
                      TextFormField(
                        controller: _konfirmasiPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 32, 169, 193),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 16, 68, 77),
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Masukkan ulang password Anda',
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value != _passwordController.text) {
                            return 'Password tidak cocok';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Tombol Daftar
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Tampilkan dialog sukses
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Pendaftaran Berhasil'),
                                content:
                                    Text('Selamat, pendaftaran Anda berhasil!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Tutup dialog
                                      // Arahkan kembali ke halaman login
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/',
                                        arguments: _namaLengkapController
                                            .text, // Kirim nama lengkap
                                      );
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 31, 146, 167),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Tombol kembali ke login
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sudah punya akun? Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30), // Jarak sebelum teks hak cipta
        ],
      ),
    );
  }

  // Method untuk membuka URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Ubah string URL menjadi format Uri
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Tidak bisa membuka $url';
    }
  }

  // Method untuk menangani klik pada teks "Daftar Sekarang!"
  void _onRegisterTextTapped() {
    setState(() {
      _opacityRegister = 0.5; // Ubah opacity menjadi 0.5 saat diklik
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacityRegister = 1.0; // Kembalikan opacity setelah 500 ms
      });
    });
  }

  // Method untuk menangani klik pada teks "Bergabunglah dengan aplikasi kami"
  void _onJoinTextTapped() {
    setState(() {
      _opacityJoin = 0.5; // Ubah opacity menjadi 0.5 saat diklik
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacityJoin = 1.0; // Kembalikan opacity setelah 500 ms
      });
    });
  }
}
