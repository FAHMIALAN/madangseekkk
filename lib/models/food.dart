// 1. Mendefinisikan class Food sebagai blueprint untuk objek makanan
class Food {

  // 2. Deklarasi variabel instance untuk menyimpan data makanan
  String name;       // 3. Menyimpan nama makanan sebagai String
  String price;      // 4. Menyimpan harga makanan sebagai String (format: "Rp.25.000")
  String imagePath;  // 5. Menyimpan path/lokasi gambar makanan di assets
  String rating;     // 6. Menyimpan rating makanan sebagai String (format: "4.5")

  // 7. Constructor utama untuk class Food
  // 8. Menggunakan named parameters dengan kurung kurawal {}
  // 9. Semua parameter wajib diisi (required)
  Food({
    required this.name,      // 10. Inisialisasi variabel name
    required this.price,     // 11. Inisialisasi variabel price
    required this.imagePath, // 12. Inisialisasi variabel imagePath 
    required this.rating,    // 13. Inisialisasi variabel rating
  });

  // 14. Getter untuk mengakses nilai name
  String get _name => name;  // 15. Mengembalikan nilai name saat dipanggil
  
  // 16. Getter untuk mengakses nilai price
  String get _price => price; // 17. Mengembalikan nilai price saat dipanggil
  
  // 18. Getter untuk mengakses nilai imagePath
  String get _imagePath => imagePath; // 19. Mengembalikan nilai imagePath saat dipanggil
  
  // 20. Getter untuk mengakses nilai rating
  String get _rating => rating; // 21. Mengembalikan nilai rating saat dipanggil
}