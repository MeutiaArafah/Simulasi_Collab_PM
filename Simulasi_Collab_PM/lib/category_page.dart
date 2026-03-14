import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    // contoh data kategori
    final List<String> categories = [
      "Kuliah",
      "Pribadi",
      "Kerja",
      "Belajar",
      "Lainnya"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori Tugas"),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.folder),
            title: Text(categories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Kategori ${categories[index]} dipilih"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}