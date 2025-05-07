import "package:flutter/material.dart"; 

class MyButton extends StatelessWidget { 
  final String text; 
  final void Function()? onTap; 

  const MyButton({ 
    super.key, // Memanggil konstruktor superclass dengan key.
    required this.text, // Memastikan teks tombol wajib diisi.
    required this.onTap, // Memastikan fungsi onTap wajib diisi.
  });

  @override
  Widget build(BuildContext context) { 
    return GestureDetector( // Menggunakan GestureDetector untuk mendeteksi sentuhan.
      onTap: onTap, // Menetapkan fungsi onTap yang akan dipanggil saat tombol ditekan.
      child: Container( // Menggunakan Container untuk membungkus tampilan tombol.
        decoration: BoxDecoration( // Mengatur dekorasi untuk tampilan tombol.
          color: Color.fromARGB(255, 253, 141, 13), // Warna tombol oranye.
          borderRadius: BorderRadius.circular(30), // Membuat sudut tombol menjadi melengkung dengan radius 30.
        ),
        padding: EdgeInsets.all(20), // Mengatur padding di dalam tombol.
        child: Row( // Menggunakan Row untuk menata elemen di dalam tombol secara horizontal.
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun elemen di tengah secara horizontal.
          children: [
            Text( // Widget teks untuk menampilkan teks tombol.
              text, // Menggunakan teks yang diterima dari parameter.
              style: TextStyle( // Mengatur gaya untuk teks.
                fontSize: 20, // Ukuran font untuk teks.
                color: const Color.fromARGB(255, 255, 255, 255), // Warna teks putih.
                fontWeight: FontWeight.bold, // Mengatur teks menjadi tebal.
              ),
            ), // ← TAMBAHKAN koma di sini
            const SizedBox(width: 10), 
            Icon( // Widget ikon untuk menambahkan simbol panah.
              Icons.arrow_forward_ios, // Menggunakan ikon panah ke depan.
              color: Color.fromARGB(255, 255, 254, 254), 
            ),
          ],
        ),
      ),
    );
  }
}