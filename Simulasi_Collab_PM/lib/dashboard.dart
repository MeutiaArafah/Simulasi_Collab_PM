import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'calendar_page.dart'; // Import file calendar yang baru
import 'category_page.dart'; // Kategori

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    // mengambil data pengguna
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'), // Judul diganti Dashboard agar lebih umum
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat datang!\n ${user?.email ?? "kosong"}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30), // Jarak antar widget
            
            // TOMBOL BARU KE HALAMAN CALENDAR
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text('Buka Kalender'),
            ),

            const SizedBox(height: 20),

            // Tombol Kategori
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryPage()),
                );
              },
              icon: const Icon(Icons.category),
              label: const Text('Kategori Tugas'),
            ),
          ],
        ),
      ),
    );
  }
}