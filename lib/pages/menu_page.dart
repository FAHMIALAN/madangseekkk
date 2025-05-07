import "package:flutter/material.dart"; 
import "package:google_fonts/google_fonts.dart"; 
import "package:provider/provider.dart"; 
import 'package:madangseekkk/components/favorite_icon.dart';
import "package:madangseekkk/components/button.dart";
import "package:madangseekkk/components/foodtitle.dart";
import "package:madangseekkk/models/food.dart";
import "package:madangseekkk/models/shop.dart";
import "package:madangseekkk/pages/food_details.dart";
import "package:madangseekkk/theme/colors.dart";

class MenuPage extends StatefulWidget { // Mendefinisikan kelas MenuPage sebagai widget yang memiliki state.
  const MenuPage({super.key}); // Konstruktor untuk MenuPage dengan key opsional.

  @override
  State<MenuPage> createState() => _MenuPageState(); // Membuat dan mengembalikan instance dari _MenuPageState.
}

class _MenuPageState extends State<MenuPage> { // Kelas state untuk MenuPage.
  void navigateToDetails(int index) { // Metode untuk navigasi ke halaman detail makanan.
    final shop = context.read<Shop>(); // Mengakses instance Shop dari konteks saat ini.
    final foodMenu = shop.foodMenu; // Mengambil daftar menu makanan dari model Shop.

    Navigator.push( // Menggunakan Navigator untuk berpindah ke halaman detail.
      context,
      MaterialPageRoute( // Membuat rute baru untuk halaman detail.
        builder: (context) => FoodDetailsPage(food: foodMenu[index]), // Mengirim makanan yang dipilih ke halaman detail.
      ),
    );
  }

  @override
  Widget build(BuildContext context) { // Metode build untuk menghasilkan tampilan widget.
    final shop = context.read<Shop>(); // Mengakses instance Shop dari konteks saat ini.
    final foodMenu = shop.foodMenu; // Mengambil daftar menu makanan dari model Shop.

    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      backgroundColor: const Color.fromARGB(255, 177, 177, 177), 
      appBar: AppBar( // Membuat AppBar di bagian atas halaman.
        foregroundColor: const Color.fromARGB(255, 0, 0, 0), 
        backgroundColor: const Color.fromARGB(0, 0, 0, 0), 
        elevation: 0, // Menghilangkan bayangan di AppBar.
        leading: const Icon(Icons.menu), // Menampilkan ikon menu di sebelah kiri AppBar.
        title: Text( // Menampilkan judul aplikasi di AppBar.
            'MADANGSEEKKK',
            style: GoogleFonts.bebasNeue( 
              fontSize: 30,
              fontWeight: FontWeight.bold, 
              color: Colors.black, 
            ),
          ),

        actions: [ // Menambahkan aksi di sebelah kanan AppBar.
          IconButton( // Menggunakan IconButton untuk menampilkan ikon keranjang.
            onPressed: () { // Aksi saat tombol ditekan.
              Navigator.pushNamed(context, '/cartPage'); // Mengarahkan pengguna ke halaman keranjang.
            },
            icon: const Icon(Icons.shopping_cart), // Ikon keranjang belanja.
          )
        ],
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView untuk memungkinkan scrolling.
        child: Column( // Menggunakan Column untuk menata elemen secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri.
          children: [
            // promo banner
            Container( // Menggunakan Container untuk banner promosi.
              decoration: BoxDecoration( // Mengatur dekorasi untuk banner.
                color: primaryColor, // Mengatur warna latar belakang banner.
                borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung.
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25), 
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30), 
              child: Row( // Menggunakan Row untuk menata elemen di dalam banner.
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyusun elemen secara merata.
                children: [
                  Column( // Menggunakan Column untuk menata teks di dalam banner.
                    crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri.
                    children: [
                      Text( // Menampilkan teks diskon.
                      'Diskon 50%', // Teks diskon.
                      style: GoogleFonts.bebasNeue( 
                        fontSize: 40, 
                        color: bgColor, 
                        fontWeight: FontWeight.bold, 
                        letterSpacing: 1.5, 
                      ),
                    ),
                      const SizedBox(height: 29), // Menambahkan jarak vertikal.
                      MyButton(text: 'Dapatkan', onTap: () {}), // Menampilkan tombol 'Dapatkan'.
                    ],
                  ),
                  Image.asset( // Menampilkan gambar promosi.
                    'assets/images/basoaci.png', // Path gambar.
                    height: 120, 
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25), // Menambahkan jarak vertikal.

            // search bar
            Padding( // Menggunakan Padding di sekitar search bar.
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Mengatur padding horizontal.
              child: TextField( // Menggunakan TextField untuk input pencarian.
                decoration: InputDecoration( // Mengatur dekorasi untuk TextField.
                  enabledBorder: OutlineInputBorder( // Mengatur border saat aktif.
                    borderSide: BorderSide(color: primaryColor), // Mengatur warna border.
                    borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung.
                  ),
                  hintText: "Search..", // Teks petunjuk di dalam TextField.
                  focusedBorder: OutlineInputBorder( // Mengatur border saat fokus.
                    borderSide: BorderSide(color: lightPrimaryColor2), 
                    borderRadius: BorderRadius.circular(20), // Membuat sudut melengkung.
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25), // Menambahkan jarak vertikal.

            // menu list
            Padding( // Menggunakan Padding di sekitar judul menu.
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Mengatur padding horizontal.
              child: Text( // Menampilkan judul "Menu Makanan".
                "Menu Makanan", // Teks judul.
                style: TextStyle( 
                  color: darkColor, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 25, 
                ),
              ),
            ),

            const SizedBox(height: 25), // Menambahkan jarak vertikal.

            SizedBox( // Menggunakan SizedBox untuk membatasi tinggi daftar makanan.
              height: 250, // Mengatur tinggi daftar.
              child: ListView.builder( // Menggunakan ListView.builder untuk membuat daftar makanan.
                scrollDirection: Axis.horizontal, // Mengatur daftar menjadi horizontal.
                itemCount: foodMenu.length, // Mengatur jumlah item yang akan ditampilkan.
                itemBuilder: (context, index) => FoodTile( // Membangun widget FoodTile untuk setiap makanan.
                  food: foodMenu[index], // Mengirim data makanan ke FoodTile.
                  onTap: () => navigateToDetails(index), // Menetapkan aksi saat FoodTile ditekan.
                ),
              ),
            ),

            const SizedBox(height: 25), // Menambahkan jarak vertikal.

            // popular food section
            Padding( // Menggunakan Padding di sekitar judul makanan populer.
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Mengatur padding horizontal.
              child: Text( // Menampilkan judul "Makanan Populer".
                "Makanan Populer", // Teks judul.
                style: TextStyle( 
                  color: darkColor, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 25, 
                ),
              ),
            ),

            const SizedBox(height: 15), // Menambahkan jarak vertikal.

            _buildPopularFoodTile('Baso Sapi', 'assets/images/basosapi.png', 'Rp. 20.000'), // Membangun tile untuk Baso Sapi.
            _buildPopularFoodTile('Mie Ayam', 'assets/images/mieayam.png', 'Rp. 15.000'), 
            _buildPopularFoodTile('Baso Aci', 'assets/images/basoaci.png', 'Rp. 15.000'), 
          ],
        ),
      ),
    );
  }

  Widget _buildPopularFoodTile(String title, String imagePath, String price) { // Metode untuk membangun tile makanan populer.
    return Container( // Menggunakan Container untuk tile makanan.
      decoration: BoxDecoration( // Mengatur dekorasi untuk tile.
        color: const Color.fromARGB(255, 231, 231, 231), 
        borderRadius: BorderRadius.circular(20), 
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10), 
      padding: const EdgeInsets.all(20), 
      child: Row( // Menggunakan Row untuk menata elemen di dalam tile.
        children: [
          Image.asset( // Menampilkan gambar makanan.
            imagePath, 
            height: 60, 
          ),
          const SizedBox(width: 25), // Menambahkan jarak horizontal.
          Expanded( // Menggunakan Expanded agar kolom mengambil sisa ruang.
            child: Column( // Menggunakan Column untuk menata teks di dalam tile.
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri.
              children: [
                Text( // Menampilkan judul makanan.
                  title,
                  style: GoogleFonts.dmSerifDisplay( // Menggunakan font DM Serif Display untuk judul.
                  fontSize: 20, 
                  color: Colors.deepOrange, 
                  fontWeight: FontWeight.bold, 
                ),
                ),
                const SizedBox(height: 10), // Menambahkan jarak vertikal.
                Text( // Menampilkan harga makanan.
                  price,
                  style: GoogleFonts.dmSerifDisplay( // Menggunakan font DM Serif Display untuk harga.
                  fontSize: 16, 
                  color: Colors.orange, 
                  fontWeight: FontWeight.bold, 
                ),
                ),
              ],
            ),
          ),
          FavoriteIcon(), // Menampilkan ikon favorit di sebelah kanan tile.
        ],
      ),
    );
  }
}