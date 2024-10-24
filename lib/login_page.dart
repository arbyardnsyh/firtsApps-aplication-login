import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _namaLengkap;

  // Variabel untuk mengontrol opacity
  double _opacityWelcome = 1.0;
  double _opacityJourney = 1.0;

  // Method untuk membuka URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Tidak bisa membuka $url';
    }
  }

  // Method untuk menangani klik pada teks "Selamat datang kembali!"
  void _onWelcomeTextTapped() {
    setState(() {
      _opacityWelcome = _opacityWelcome == 1.0 ? 0.5 : 1.0; // Toggle opacity
    });

    // Mengembalikan opacity ke 1 setelah 500 ms
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacityWelcome = 1.0; // Kembalikan opacity ke normal
      });
    });
  }

  // Method untuk menangani klik pada teks "Masuk dan mulai perjalananmu hari ini"
  void _onJourneyTextTapped() {
    setState(() {
      _opacityJourney = _opacityJourney == 1.0 ? 0.5 : 1.0; // Toggle opacity
    });

    // Mengembalikan opacity ke 1 setelah 500 ms
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacityJourney = 1.0; // Kembalikan opacity ke normal
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background gradasi warna hijau ke putih
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 143, 206, 255), // Warna hijau atas
              Color.fromARGB(255, 255, 255, 255), // Warna putih bawah
            ],
          ),
        ),
        child: Column(
          children: [
            // Gambar atas dengan sudut melengkung dan diperpanjang ke bawah
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom:
                    Radius.circular(40.0), // Melengkung hanya di bagian bawah
              ),
              child: Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Lebar penuh sesuai layar
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/foto.jpeg'),
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
                        onTap:
                            _onWelcomeTextTapped, // Tambahkan GestureDetector
                        child: AnimatedOpacity(
                          duration:
                              Duration(milliseconds: 200), // Durasi animasi
                          opacity:
                              _opacityWelcome, // Menggunakan variabel opacity
                          child: Text(
                            'Selamat datang kembali!',
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
                        onTap:
                            _onJourneyTextTapped, // Tambahkan GestureDetector
                        child: AnimatedOpacity(
                          duration:
                              Duration(milliseconds: 200), // Durasi animasi
                          opacity:
                              _opacityJourney, // Menggunakan variabel opacity
                          child: Text(
                            'Masuk dan mulai perjalananmu hari ini',
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
            SizedBox(height: 20),

            // Card berisi form login
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
                                color: const Color.fromARGB(255, 16, 68, 77),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 32, 169, 193),
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
                                color: const Color.fromARGB(255, 16, 68, 77),
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 32, 169, 193),
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
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),

                        // Tombol Login
                        ElevatedButton(
                          onPressed: () {
                            // Validasi form login (jika ada)
                            if (_formKey.currentState!.validate()) {
                              // Ambil nama lengkap dari arguments
                              final String? namaLengkap = ModalRoute.of(context)
                                  ?.settings
                                  .arguments as String?;

                              // Arahkan ke WelcomePage setelah login berhasil
                              Navigator.pushReplacementNamed(
                                context,
                                '/welcome',
                                arguments: namaLengkap ?? 'Pengguna',
                              );
                            }
                          },
                          child: Text(
                            'Login',
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

                        // Tombol daftar
                        TextButton(
                          onPressed: () async {
                            final result =
                                await Navigator.pushNamed(context, '/register');
                            if (result != null) {
                              setState(() {
                                _namaLengkap = result as String;
                              });
                            }
                          },
                          child: Text(
                            'Belum punya akun? Daftar',
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
            SizedBox(height: 30), // Jarak sebelum footer

            // Footer untuk ikon sosial media
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ikon GitHub
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icon/github.png', // Path ikon GitHub
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        _launchURL(
                            'https://github.com/arbyardnsyh'); // URL GitHub
                      },
                    ),
                    Text(
                      'Github', // Teks di bawah ikon GitHub
                      style: TextStyle(
                        color: Colors.black, // Warna teks hitam
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Jarak antara ikon

                // Ikon LinkedIn
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icon/linkedin.png', // Path ikon LinkedIn
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        _launchURL(
                            'https://www.linkedin.com/in/arby-ardiansyah/'); // URL LinkedIn
                      },
                    ),
                    Text(
                      'LinkedIn', // Teks di bawah ikon LinkedIn
                      style: TextStyle(
                        color: Colors.black, // Warna teks hitam
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20), // Jarak antara ikon

                // Ikon Instagram
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icon/instagram.png', // Path ikon Instagram
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        _launchURL(
                            'https://www.instagram.com/arbyardnsyh/'); // URL Instagram
                      },
                    ),
                    Text(
                      'Instagram', // Teks di bawah ikon Instagram
                      style: TextStyle(
                        color: Colors.black, // Warna teks hitam
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40), // Jarak sebelum teks hak cipta

            // Teks Hak Cipta
            Text(
              '© 2024 arby.ardnsyh_',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 20), // Jarak di bawah footer
          ],
        ),
      ),
    );
  }
}
