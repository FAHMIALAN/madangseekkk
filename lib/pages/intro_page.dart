import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart'; 
import 'package:madangseekkk/components/button.dart';

class IntroPage extends StatelessWidget { // Mendefinisikan kelas IntroPage sebagai widget stateless.
  const IntroPage({super.key}); // Konstruktor untuk IntroPage dengan key opsional.

  @override
  Widget build(BuildContext context) { // Metode build untuk menghasilkan tampilan widget.
    return Scaffold( // Menggunakan Scaffold untuk struktur dasar halaman.
      backgroundColor: Color.fromARGB(255, 0, 0, 0), 
      body: Padding( // Menggunakan Padding untuk memberikan ruang di sekitar konten.
        padding: const EdgeInsets.all(25.0), // Mengatur padding di semua sisi.
        child: Column( // Menggunakan Column untuk menata elemen secara vertikal.
          crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen ke kiri.
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Menyebar elemen secara merata.
          children: [
            const SizedBox(height: 25), // Menambahkan jarak vertikal di atas.
            //icon
            Padding( // Menggunakan Padding di sekitar ikon.
              padding: const EdgeInsets.all(10.0), // Mengatur padding di sekitar ikon.
              child: Image.asset('assets/images/logo.png'), // Menampilkan gambar logo dari asset.
            ),
            
            Text( // Menampilkan judul aplikasi.
              "Cita Rasa Makanan Indonesia", // Teks judul.
              textAlign: TextAlign.center, // Mengatur perataan teks menjadi tengah.
              style: GoogleFonts.poppins( // Menggunakan font Poppins untuk teks.
                fontSize: 34, 
                color: Color.fromARGB(255, 255, 255, 255), 
              ),
            ),
            const SizedBox(height: 20), // Menambahkan jarak vertikal di antara elemen.
            Text( // Menampilkan deskripsi aplikasi.
              "Rasakan cita rasa makanan Indonesia terpopuler dari mana saja dan kapan saja", // Teks deskripsi.
              textAlign: TextAlign.center, // Mengatur perataan teks menjadi tengah.
              style: TextStyle( // Mengatur gaya untuk teks deskripsi.
                color: Color.fromARGB(255, 255, 255, 255), 
                height: 2,
                fontSize: 18, 
              ),
            ),

            const SizedBox( // Menambahkan jarak vertikal di bawah deskripsi.
              height: 25,
            ),

            // get start
            MyButton( // Menggunakan MyButton untuk menampilkan tombol mulai.
              text: "Mulai", // Teks tombol.
              onTap: () { // Aksi saat tombol ditekan.
                Navigator.pushNamed(context, '/menuPage'); // Menavigasi ke halaman menuPage.
              },
            )
          ],
        ),
      ),
    ); 
  }
}