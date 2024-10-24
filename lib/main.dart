import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'welcome_page.dart'; // Import halaman welcome

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arby first app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/welcome': (context) =>
            (ModalRoute.of(context)!.settings.arguments != null)
                ? WelcomePage(
                    namaLengkap:
                        ModalRoute.of(context)!.settings.arguments as String)
                : WelcomePage(namaLengkap: ''),
      },
    );
  }
}
