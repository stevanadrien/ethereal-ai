import 'dart:io' as io;
class Product {


  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String expirationDate;
  final String distance;
  final String foodType;
  final String location;
  final int stok; // added stok property
  final String priceRange;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.expirationDate,
    required this.distance,
    required this.foodType,
    required this.location,
    required this.stok, // added stok to the constructor
    required this.priceRange,
  });

  // Add a factory method to create a Product from the AddProductCardScreen data
  factory Product.fromAddProductCardScreen({
    required String namaMakanan,
    required String deskripsiMakanan,
    required String hargaMakanan,
    required io.File? imageFile,
    required String kadaluwarsa,
    required int jangkauan,
    required String jenisMakanan,
    required String location,
    required int stok, // added stok parameter
    required String priceRange,
  }) {
    return Product(
      id: DateTime.now().toString(),
      title: namaMakanan,
      description: deskripsiMakanan,
      price: double.parse(hargaMakanan),
      imageUrl: imageFile?.path ?? '',
      expirationDate: kadaluwarsa,
      distance: jangkauan.toString(),
      foodType: jenisMakanan,
      location: location,
      stok: stok, // added stok to the Product constructor
      priceRange: priceRange,
    );
  }
}