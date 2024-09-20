import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/penjual_product_bottom_sheet.dart'; // Import the ProductBottomSheet widget

class PenjualProductCard extends StatelessWidget {
  final Product product;
  final int index;
  final void Function() onRemove; // Add this callback

  const PenjualProductCard({Key? key, required this.product, required this.index,  required this.onRemove}) : super(key: key);

  void _showPenjualProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PenjualProductBottomSheet(product: product); // Pass the product to the bottom sheet
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPenjualProductBottomSheet(context), // Trigger the bottom sheet on tap
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: onRemove,
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            contentPadding: EdgeInsets.all(16.0),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Distance: ${product.distance}',
                                  style: TextStyle(
                                    color: Color(0xFF0A6847),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500, // Semi-bold
                                  ),
                                ),
                                Text(
                                  'Food Type: ${product.foodType}',
                                  style: TextStyle(
                                    color: Color(0xFF0A6847),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500, // Semi-bold
                                  ),
                                ),
                                Text(
                                  'Location: ${product.location}',
                                  style: TextStyle(
                                    color: Color(0xFF0A6847),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500, // Semi-bold
                                  ),
                                ),
                                Text(
                                  'Expiration Date: ${product.expirationDate}', // Use expirationDate as a String
                                  style: TextStyle(
                                    color: Color(0xFF0A6847),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500, // Semi-bold
                                  ),
                                ),
                                Text(
                                  'Price: Rp ${product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}