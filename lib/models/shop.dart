import 'package:flutter/material.dart';
import 'package:madangseekkk/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [ // Daftar menu makanan bersifat final (tidak bisa diubah)
    Food(
      name: "Nasi Goreng",
      price: '15000',
      imagePath: 'assets/images/nasigoreng.png',
      rating: '4,5',
    ),
    Food(
      name: "Sate Ayam",
      price: '15000',
      imagePath: 'assets/images/sateayam.png',
      rating: '4,9',
    ),
    Food(
      name: "Soto Ayam",
      price: '15000',
      imagePath: 'assets/images/sotoayam.png',
      rating: '4,5',
    ),
    Food(
      name: "Bakso Sapi",
      price: '20000',
      imagePath: 'assets/images/basosapi.png',
      rating: '4,9',
    ),
    Food(
      name: "Mie Ayam",
      price: '15000',
      imagePath: 'assets/images/mieayam.png',
      rating: '4,7',
    ),
    Food(
      name: "Baso Aci",
      price: '15000',
      imagePath: 'assets/images/basoaci.png',
      rating: '4,1',
    ),
  ];

  List<Food> _cart = []; // 8. Keranjang belanja kosong untuk menyimpan pesanan

  List<Food> get foodMenu => _foodMenu; //  Getter untuk mengakses menu makanan
  List<Food> get cart => _cart; //  Getter untuk mengakses keranjang belanja

  void addToCard(Food foodItem, int qty) { //  Method untuk menambah item ke keranjang
    for (var i = 0; i < qty; i++) { //  Loop sesuai jumlah yang diminta
      _cart.add(foodItem); // Tambahkan item ke keranjang
    }
    notifyListeners(); 
  }

  void removeCart(Food food) { //  Method untuk menghapus item dari keranjang
    _cart.remove(food); //  Hapus item tertentu dari keranjang
    notifyListeners(); 
  }
}