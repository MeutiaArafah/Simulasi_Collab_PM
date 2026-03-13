import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart'; // manggil dile sahboard

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginPage();
}

class LoginPage extends State<Login> {
  Future<void> login() async {
    try {
      final provider = GoogleAuthProvider();
      provider.setCustomParameters({'prompt': 'select_account'});

      // memunculkan pop-up Google
      await FirebaseAuth.instance.signInWithPopup(provider);

      // jika berhasil, pindah ke dashboard
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HalamanUtama()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login gagal: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          label: const Text('Login dengan google'),
          onPressed: login,
        ),
      ),
    );
  }
}
