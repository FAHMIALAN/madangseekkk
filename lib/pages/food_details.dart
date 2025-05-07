import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; 
import 'package:madangseekkk/components/button.dart';
import 'package:madangseekkk/models/food.dart';
import 'package:madangseekkk/models/shop.dart';
import 'package:madangseekkk/theme/colors.dart';

class FoodDetailsPage extends StatefulWidget { // Mendefinisikan kelas FoodDetailsPage sebagai widget yang memiliki state.
  final Food food; // Menyimpan objek Food yang diterima dari parameter.
  const FoodDetailsPage({super.key, required this.food}); // Konstruktor untuk FoodDetailsPage dengan key dan food.

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState(); // Membuat dan mengembalikan instance dari _FoodDetailsPageState.
}

class _FoodDetailsPageState extends State<FoodDetailsPage> { // Kelas state untuk FoodDetailsPage.
  int qtyCount = 0; // Variabel untuk menyimpan jumlah kuantitas makanan yang dipilih.

  void decrementQuantity() { // Metode untuk mengurangi jumlah kuantitas.
    setState(() { // Memanggil setState agar tampilan diperbarui.
      if (qtyCount > 0) { // Memastikan kuantitas tidak negatif.
        qtyCount--; // Mengurangi kuantitas.
      }
    });
  }

  void incrementQuantity() { // Metode untuk menambah jumlah kuantitas.
    setState(() { // Memanggil setState agar tampilan diperbarui.
      qtyCount++; // Menambah kuantitas.
    });
  }

  void addToCart() { // Metode untuk menambahkan makanan ke keranjang.
    if (qtyCount > 0) { // Memastikan kuantitas lebih dari 0 sebelum menambahkan.
      final shop = context.read<Shop>(); // Mengakses instance Shop dari konteks saat ini.
      shop.addToCard(widget.food, qtyCount); // Menambahkan makanan ke keranjang di model Shop.

      showDialog( // Menampilkan dialog setelah berhasil menambahkan ke keranjang.
        context: context,
        barrierDismissible: false, // Mencegah dialog ditutup saat diklik di luar.
        builder: (context) => AlertDialog( // Membangun AlertDialog.
          backgroundColor: primaryColor, 
          content: const Text( // Menampilkan pesan di dalam dialog.
            "Berhasil Dimasukan Keranjang", 
            style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 20 
            ),
            textAlign: TextAlign.center, // Mengatur perataan teks menjadi tengah.
          ),
          actions: [ // Menambahkan aksi di dalam dialog.
          IconButton( // Menggunakan IconButton untuk menutup dialog.
            onPressed: () { 
              Navigator.pop(context); 
              Navigator.pop(context); 
            },
            icon: Icon( // Menggunakan ikon untuk tombol.
              Icons.done, // Ikon centang.
              color: const Color.fromARGB(255, 255, 0, 0), 
            ),
          ),
        ]
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk menghasilkan tampilan widget.
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      appBar: AppBar( // Membuat AppBar di bagian atas halaman.
        backgroundColor: Colors.transparent, 
        elevation: 0, // Menghilangkan bayangan di AppBar.
        foregroundColor: Colors.grey[900], 
      ),
      body: Column( // Menggunakan Column untuk menata elemen di dalam tubuh halaman.
        children: [
          Expanded( // Menggunakan Expanded agar ListView mengisi ruang yang tersedia.
            child: Padding( // Menambahkan padding di sekitar ListView.
              padding: const EdgeInsets.symmetric(horizontal: 25), 
              child: ListView( // Menggunakan ListView untuk menampilkan daftar informasi makanan.
                children: [
                  //image
                  Image.asset( // Menampilkan gambar makanan dari asset.
                    widget.food.imagePath, // Menggunakan path gambar dari objek Food.
                    height: 200, 
                  ),

                  const SizedBox(width: 25), // Menambahkan jarak horizontal.
                  //rating
                  Row( // Menggunakan Row untuk menata ikon dan rating secara horizontal.
                    children: [
                      Icon( // Menampilkan ikon bintang.
                        Icons.star,
                        color: Colors.yellow[700], 
                      ),
                      const SizedBox(height: 25), // Menambahkan jarak vertikal.
                      Text( // Menampilkan rating makanan.
                        widget.food.rating, // Mengambil rating dari objek Food.
                        style: TextStyle(
                          color: const Color.fromARGB(255, 249, 1, 1), 
                          fontWeight: FontWeight.bold, 
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25), // Menambahkan jarak vertikal.

                  //food name
                  Text( // Menampilkan nama makanan.
                    widget.food.name, // Mengambil nama dari objek Food.
                    style: GoogleFonts.poppins(fontSize: 30), // Menggunakan font Poppins untuk teks.
                  ),

                  const SizedBox(height: 25), // Menambahkan jarak vertikal.

                  //desc
                  Text( // Menampilkan judul deskripsi.
                    "Deskripsi", // Teks judul.
                    style: TextStyle(
                      color: Colors.grey[900], 
                      fontWeight: FontWeight.bold, 
                      fontSize: 20, 
                    ),
                  ),

                  const SizedBox(height: 10), // Menambahkan jarak vertikal.

                  Text( // Menampilkan deskripsi makanan.
                    "Bakso adalah bola daging yang kenyal dan lezat, biasanya terbuat dari daging sapi yang digiling halus. Disajikan dalam kuah kaldu yang hangat, bakso sering dipadukan dengan mie dan sayuran segar, menciptakan rasa yang kaya dan memuaskan.", // Deskripsi makanan.
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0), 
                      fontSize: 16, 
                      height: 2, 
                    ),
                  )
                ],
              ),
            ),
          ),

          Container( // Menggunakan Container untuk bagian bawah halaman.
            color: primaryColor, 
            padding: const EdgeInsets.all(25), // Mengatur padding di dalam Container.
            child: Column( // Menggunakan Column untuk menata elemen di dalam Container.
              children: [
                Row( // Menggunakan Row untuk menata harga dan kuantitas secara horizontal.
                  mainAxisAlignment: MainAxisAlignment.spaceAround, // Menyusun elemen secara merata.
                  children: [
                    //price
                    Text( // Menampilkan harga makanan.
                        'Rp.' + widget.food.price, // Mengambil harga dari objek Food dan menampilkannya.
                      style: const TextStyle(
                         color: Colors.deepOrange, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 20), 
                    ),

                    //quantity
                    Row( // Menggunakan Row untuk menata tombol kuantitas secara horizontal.
                      children: [
                        //minus button
                        Container( // Menggunakan Container untuk tombol minus.
                          decoration: BoxDecoration(
                            color: secondaryColor, // Mengatur warna latar belakang tombol.
                            shape: BoxShape.circle, // Membuat tombol berbentuk bulat.
                          ),
                          child: IconButton( // Menggunakan IconButton untuk tombol minus.
                            icon: const Icon(
                              Icons.remove, // Ikon minus.
                              color: Colors.white, 
                            ),
                            onPressed: decrementQuantity, 
                          ),
                        ),

                        //quantity count
                        SizedBox( // Menggunakan SizedBox untuk mengatur ukuran.
                          width: 40, // Mengatur lebar untuk tampilan kuantitas.
                          child: Center( // Menyusun teks kuantitas di tengah.
                            child: Text(
                              qtyCount.toString(), // Menampilkan jumlah kuantitas.
                              style: const TextStyle(
                                  color: Colors.black, // Mengatur warna teks kuantitas.
                                  fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal.
                                  fontSize: 18), 
                            ),
                          ),
                        ),

                        //plus button
                        Container( // Menggunakan Container untuk tombol plus.
                          decoration: BoxDecoration(
                            color: secondaryColor, // Mengatur warna latar belakang tombol.
                            shape: BoxShape.circle, // Membuat tombol berbentuk bulat.
                          ),
                          child: IconButton( // Menggunakan IconButton untuk tombol plus.
                            icon: const Icon(
                              Icons.add, // Ikon plus.
                              color: Colors.white, 
                            ),
                            onPressed: incrementQuantity, 
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25), 
                MyButton(text: "Masukan Keranjang", onTap: addToCart) // Menampilkan tombol untuk menambahkan ke keranjang.
              ],
            ),
          ),
        ],
      ),
    );
  }
}