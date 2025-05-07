import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import 'package:madangseekkk/models/shop.dart';
import 'package:madangseekkk/pages/cart_page.dart';
import 'package:madangseekkk/pages/intro_page.dart';
import 'package:madangseekkk/pages/menu_page.dart';

void main() { // Fungsi utama untuk menjalankan aplikasi.
  runApp(ChangeNotifierProvider( // Menggunakan ChangeNotifierProvider untuk mengelola state.
    create: (context) => Shop(), // Membuat instance Shop untuk manajemen state.
    child: const MyApp(), // Menjalankan MyApp sebagai widget utama.
  ));
}

class MyApp extends StatelessWidget { // Mendefinisikan kelas MyApp sebagai widget stateless.
  const MyApp({super.key}); // Konstruktor untuk MyApp dengan key opsional.

  @override
  Widget build(BuildContext context) { // Metode build untuk menghasilkan tampilan widget.
    return MaterialApp( // Menggunakan MaterialApp untuk struktur aplikasi.
      title: 'INDONESIAN FOOD', // Judul aplikasi.
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di sudut kanan atas.
      home: IntroPage(), // Menetapkan IntroPage sebagai halaman awal.
      routes: { // Mendefinisikan rute untuk navigasi.
        '/introPage': (context) => const IntroPage(), // Rute untuk halaman intro.
        '/menuPage': (context) => const MenuPage(), // Rute untuk halaman menu.
        '/cartPage': (context) => const CartPage(), // Rute untuk halaman keranjang.
      },
    );
  }
}

class MyHomePage extends StatefulWidget { // Mendefinisikan kelas MyHomePage sebagai widget yang memiliki state.
  const MyHomePage({super.key, required this.title}); // Konstruktor untuk MyHomePage dengan title.

  final String title; // Menyimpan judul yang diterima dari parameter.

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Membuat dan mengembalikan instance dari _MyHomePageState.
}

class _MyHomePageState extends State<MyHomePage> { // Kelas state untuk MyHomePage.
  int _counter = 0; // Variabel untuk menyimpan hitungan.

  void _incrementCounter() { // Metode untuk menambah hitungan.
    setState(() { // Memanggil setState agar tampilan diperbarui.
      _counter++; // Meningkatkan hitungan.
    });
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk menghasilkan tampilan widget.
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      appBar: AppBar( // Membuat AppBar di bagian atas halaman.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Mengatur warna latar belakang AppBar.
        title: Text(widget.title), // Menampilkan judul di AppBar.
      ),
      body: Center( // Menempatkan konten di tengah halaman.
        child: Column( // Menggunakan Column untuk menata elemen secara vertikal.
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun elemen ke tengah.
          children: <Widget>[
            const Text( // Menampilkan teks statis.
              'Anda sudah menekan tombol ini terlalu banyak:', // Pesan informasi.
            ),
            Text( // Menampilkan hitungan.
              '$_counter', // Menampilkan nilai hitungan.
              style: Theme.of(context).textTheme.headlineMedium, // Mengatur gaya teks.
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( // Menampilkan tombol aksi mengapung.
        onPressed: _incrementCounter, // Menetapkan aksi saat tombol ditekan.
        tooltip: 'Kenaikan', // Tooltip untuk tombol.
        child: const Icon(Icons.add), // Ikon untuk tombol.
      ),
    );
  }
}