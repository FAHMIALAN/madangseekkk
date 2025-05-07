import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart'; 
import 'package:madangseekkk/models/food.dart';
import 'package:madangseekkk/theme/colors.dart';

class FoodTile extends StatelessWidget { 
// Mendefinisikan class FoodTile sebagai StatelessWidget (tidak berubah state-nya)

  final Food food; 
  // Variabel untuk menyimpan data makanan yang akan ditampilkan

  final void Function()? onTap; 
  // Callback function yang akan dijalankan ketika widget di-tap

  const FoodTile({ 
  // Constructor untuk FoodTile dengan parameter wajib food dan onTap
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) { 
  // Method build yang wajib ada di StatelessWidget untuk membangun UI
    return GestureDetector( 
    // Widget yang mendeteksi gesture seperti tap
      onTap: onTap, 
      // Menjalankan callback onTap ketika widget di-tap
      child: Container( 
      // Container sebagai wadah utama untuk konten food tile
        width: MediaQuery.of(context).size.width * .5, 
        // Lebar container setengah dari lebar layar
        decoration: BoxDecoration( 
        // Dekorasi untuk container
          color: Colors.grey[100], 
          // Warna latar abu-abu muda
          borderRadius: BorderRadius.circular(20), 
          // Sudut container yang melengkung
        ),
        margin: const EdgeInsets.only(left: 25), 
        // Margin hanya di kiri sebesar 25 pixel
        padding: const EdgeInsets.all(25), 
        // Padding di semua sisi sebesar 25 pixel
        child: Column( 
        // Column untuk menyusun children secara vertikal
            mainAxisSize: MainAxisSize.min, 
            // Column hanya mengambil space yang dibutuhkan
            mainAxisAlignment: MainAxisAlignment.center, 
            // Children diatur ke tengah vertikal
            crossAxisAlignment: CrossAxisAlignment.start, 
            // Children diatur ke kiri horizontal
            children: [
              //imaged
              Center( 
              // Widget untuk membuat child-nya ke tengah
                child: Image.asset( 
                // Widget untuk menampilkan gambar dari assets
                  food.imagePath, 
                  // Path gambar dari objek food
                  height: 100, 
                  // Tinggi gambar 100 pixel
                ),
              ),

              const SizedBox(height: 20), 
              // Spacer vertikal setinggi 20 pixel

             //text
              Text( 
              // Widget untuk menampilkan teks nama makanan
                food.name, 
                // Nama makanan dari objek food
                style: GoogleFonts.poppins( 
                // Menggunakan font Poppins dari Google Fonts
                  fontSize: 20, 
                  // Ukuran font 20
                  fontWeight: FontWeight.bold, 
                  // Tebal font bold
                  color: Colors.deepOrange, 
                  // Warna teks jingga tua
                ),
              ),

              //price + rating
              Row( 
              // Row untuk menyusun harga dan rating secara horizontal
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                // Children diatur dengan space di antaranya
                children: [
                  //price
                  Text( 
                  // Widget untuk menampilkan harga
                    'Rp.' + food.price, 
                    // Format harga dengan prefix Rp.
                    style: TextStyle( 
                    // Style untuk teks harga
                      fontWeight: FontWeight.bold, 
                      // Tebal font bold
                      color: Colors.orange, 
                      // Warna teks orange
                    ),
                  ),
                  //rating
                  Row( 
                  // Row untuk menyusun icon bintang dan nilai rating
                    children: [
                      Icon( 
                      // Widget untuk menampilkan icon
                        Icons.star, 
                        // Icon bintang dari Material Icons
                        color: Colors.yellow[700], 
                        // Warna kuning untuk icon
                      ),
                      Text( 
                      // Widget untuk menampilkan nilai rating
                        food.rating, 
                        // Nilai rating dari objek food
                        style: TextStyle(color: lightPrimaryColor), 
                        // Style teks dengan warna dari theme
                      ),
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}