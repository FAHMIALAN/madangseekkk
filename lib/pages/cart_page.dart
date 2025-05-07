import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
import 'package:provider/provider.dart'; 
import 'package:madangseekkk/components/button.dart';
import 'package:madangseekkk/models/food.dart';
import 'package:madangseekkk/models/shop.dart';
import 'package:madangseekkk/theme/colors.dart';

class CartPage extends StatelessWidget { // Mendefinisikan kelas CartPage sebagai widget stateless.
  const CartPage({super.key}); // Konstruktor untuk CartPage dengan key opsional.

  void removeFromCart(Food food, BuildContext context) { // Metode untuk menghapus makanan dari keranjang.
    final shop = context.read<Shop>(); // Mengakses instance Shop dari konteks saat ini.
    shop.removeCart(food); // Memanggil metode untuk menghapus makanan dari keranjang.
  }

  void payButtonClick() { // Metode kosong untuk aksi saat tombol bayar ditekan.
    // Implementasi metode pembayaran dapat ditambahkan di sini.
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk menghasilkan tampilan widget.
    return Consumer<Shop>( 
      builder: (context, value, child) => Scaffold( // Membangun tampilan Scaffold untuk halaman.
        backgroundColor: primaryColor, // Mengatur warna latar belakang halaman.
        appBar: AppBar( // Membuat AppBar di bagian atas halaman.
          title: Text( 
            "Keranjang", // Teks judul halaman.
            style: TextStyle(
              fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal.
            ),
          ),
          backgroundColor: primaryColor, 
          foregroundColor: whiteColor, 
          elevation: 0, 
        ),

        body: Column( // Menggunakan Column untuk menata elemen di dalam tubuh halaman.
          children: [
            Expanded( // Menggunakan Expanded agar ListView mengisi ruang yang tersedia.
              child: ListView.builder( // Menggunakan ListView.builder untuk membuat daftar makanan.
                itemCount: value.cart.length, // Mengatur jumlah item yang akan ditampilkan.
                itemBuilder: (context, index) { 
                  final Food food = value.cart[index]; // Mengambil makanan dari keranjang berdasarkan indeks.
                  final String foodName = food.name;
                  String foodPrice = food.price; 

                  // Mengembalikan widget Container untuk setiap item makanan.
                  return Container(
                    decoration: BoxDecoration( // Mengatur dekorasi untuk Container.
                      color: secondaryColor, 
                      borderRadius: BorderRadius.circular(15), // Membuat sudut melengkung.
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20), 
                    child: ListTile( // Menggunakan ListTile untuk menampilkan informasi makanan.
                      title: Text( // Menampilkan nama makanan.
                        foodName, // Nama makanan yang ditampilkan.
                        style: const TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold, 
                          fontSize: 18, 
                        ),
                      ),
                      subtitle: Text( // Menampilkan harga makanan sebagai subtitle.
                        foodPrice, 
                        style: TextStyle(
                          color: Colors.grey[200], 
                        ),
                      ),
                      trailing: IconButton( // Menambahkan tombol ikon di sebelah kanan.
                          onPressed: () => removeFromCart(food, context), // Menghapus makanan saat tombol ditekan.
                          icon: Icon(
                            Icons.delete, // Menggunakan ikon delete.
                            color: darkColor, 
                            size: 30, 
                          )),
                    ),
                  );
                },
              ),
            ),

            Padding( // Menambahkan padding di sekitar tombol bayar.
              padding: const EdgeInsets.all(25.0), // Mengatur padding di semua sisi.
              child: MyButton(text: "Bayar Sekarang", onTap: payButtonClick), // Menampilkan tombol bayar.
            )
          ],
        ),
      ),
    );
  }
}