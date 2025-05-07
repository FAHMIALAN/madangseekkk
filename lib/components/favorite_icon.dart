import 'package:flutter/material.dart';

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
  // 1. Ini adalah deklarasi StatefulWidget yang akan menyimpan state (status favorit)
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;
  // 2. Variabel state untuk menyimpan status favorit (true/false)

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        // 3. Menggunakan operator ternary untuk memilih icon berdasarkan status
        color: isFavorite ? Colors.red : Colors.grey,
        // 4. Warna icon berubah sesuai status (merah untuk favorit)
        size: 28,
        // 5. Ukuran icon diatur ke 28 pixel
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}