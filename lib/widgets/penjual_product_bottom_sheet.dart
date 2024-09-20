import 'package:flutter/material.dart';
import '../models/product.dart';

class PenjualProductBottomSheet extends StatefulWidget {
  final Product product;

  PenjualProductBottomSheet({required this.product});

  @override
  _PenjualProductBottomSheetState createState() => _PenjualProductBottomSheetState();
}

class _PenjualProductBottomSheetState extends State<PenjualProductBottomSheet> {
  int _quantity = 1; // Initial quantity

  String formatRupiah(double amount) {
    return 'Rp ' + amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
    );
  }

  String formatDate(String date) {
    // Assuming the date string is in yyyy-MM-dd format
    DateTime dateTime = DateTime.parse(date);
    String year = dateTime.year.toString();
    String month = dateTime.month.toString().padLeft(2, '0');
    String day = dateTime.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    final double totalPrice = widget.product.price * _quantity;

    return Container(
        padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    child: IntrinsicHeight(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.network(
    widget.product.imageUrl,
    fit: BoxFit.cover,
    width: double.infinity,
    height: 200,
    ),
    ),
    SizedBox(height: 10),
    Text(
    widget.product.title,
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    ),
    ),
    SizedBox(height: 10),
    Text(
    widget.product.description,
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    ),
    ),
    SizedBox(height: 10),
    Container(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
    color: Color(0xFFF3CA52), // Same style as card
    borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
    'Exp: ${formatDate(widget.product.expirationDate)}', // Format expiration date
    style: TextStyle(
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    ),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    'Quantity',
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    ),
    ),
    Container(
    width: 120, // Specify the width of the Container
    child: Row(
    children: [
    IconButton(
    icon: Icon(Icons.remove),
    onPressed: () {
    setState(() {
    if (_quantity > 1) {
    _quantity--;
    }
    });
    },
    ),
    Text(
    '$_quantity',
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    ),
    ),
    IconButton(
    icon: Icon(Icons.add),
    onPressed: () {
    setState(() {
    _quantity++;
    });
    },
    ),
    ],
    ),
    ),
    ],
    ),
    SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    'Total Price',
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
    ),
    ),
    Text(
    formatRupiah(totalPrice),
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    SizedBox(height: 20),
    Expanded(
    child: Align(
    alignment: Alignment.bottomCenter,
    child: ElevatedButton
      (
      onPressed: () {
        // Navigate to Chat Screen
        Navigator.pushNamed(context, '/addproductcard');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF3CA52), // Custom green color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        minimumSize: Size(double.infinity, 50), // Full width button
      ),
      child: Text(
        'Edit',
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    ),
    ),
    ],
    ),
    ),
    );
  }
}