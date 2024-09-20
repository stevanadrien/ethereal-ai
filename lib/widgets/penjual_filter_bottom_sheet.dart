import 'package:flutter/material.dart';
import '../models/filter.dart';

class PenjualFilterBottomSheet extends StatefulWidget {
  final void Function(Filter filter) onFilterApplied;
  final List<String> availableFoodTypes; // Add this line

  PenjualFilterBottomSheet({
    required this.onFilterApplied,
    required this.availableFoodTypes, // Add this line
  });


  @override
  _PenjualFilterBottomSheetState createState() => _PenjualFilterBottomSheetState();
}

class _PenjualFilterBottomSheetState extends State<PenjualFilterBottomSheet> {
  List<String> _selectedPriceRanges = [];
  List<String> _selectedFoodTypes = [];
  bool _sortByNearestLocation = false;

  void _applyFilters() {
    final filter = Filter(
      priceRanges: _selectedPriceRanges,
      foodTypes: _selectedFoodTypes,
      sortByNearestLocation: _sortByNearestLocation,
    );

    widget.onFilterApplied(filter);
    Navigator.of(context).pop();
  }

  void _clearFilters() {
    setState(() {
      _selectedPriceRanges.clear();
      _selectedFoodTypes.clear();
      _sortByNearestLocation = false;
    });
  }

  void _togglePriceRange(String range) {
    setState(() {
      if (_selectedPriceRanges.contains(range)) {
        _selectedPriceRanges.remove(range);
      } else {
        _selectedPriceRanges.add(range);
      }
    });
  }

  void _toggleFoodType(String type) {
    setState(() {
      if (_selectedFoodTypes.contains(type)) {
        _selectedFoodTypes.remove(type);
      } else {
        _selectedFoodTypes.add(type);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Changed the background color to yellow
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black, // Changed from default color to black
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Filter by Price Range',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black, // Changed from default color to black
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                CheckboxListTile(
                  title: Text('Di bawah Rp.5000'),
                  value: _selectedPriceRanges.contains('Di bawah Rp.5000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Di bawah Rp.5000');
                  },
                  tileColor: Colors.yellow[100], // Changed the tile color to yellow
                ),
                CheckboxListTile(
                  title: Text('Rp.5000 - Rp.50.000'),
                  value: _selectedPriceRanges.contains('Rp.5000 - Rp.50.000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Rp.5000 - Rp.50.000');
                  },
                  tileColor: Colors.yellow[100], // Changed the tile color to yellow
                ),
                CheckboxListTile(
                  title: Text('Rp.50.000 - Rp.100.000'),
                  value: _selectedPriceRanges.contains('Rp.50.000 - Rp.100.000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Rp.50.000 - Rp.100.000');
                  },
                  tileColor: Colors.yellow[100], // Changed the tile color to yellow
                ),
                CheckboxListTile(
                  title: Text('Di atas Rp.100.000'),
                  value: _selectedPriceRanges.contains('Di atas Rp.100.000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Di atas Rp.100.000');
                  },
                  tileColor: Colors.yellow[100], // Changed the tile color to yellow
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Filter by Food Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black, // Changed from default color to black
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                // CheckboxListTile(
                // title: Text('Vegetarian'),
                // value: _selectedFoodTypes.contains('Vegetarian'),
                // onChanged: (bool? value) {
                // _toggleFoodType('Vegetarian');
                // },
                // tileColor: Colors.yellow[100], // Changed the tile color to yellow
                // ),
                // CheckboxListTile(
                // title: Text('Non-Vegetarian'),
                // value: _selectedFoodTypes.contains('Non-Vegetarian'),
                // onChanged: (bool? value) {
                // _toggleFoodType('Non-Vegetarian');
                // },
                // tileColor: Colors.yellow[100], // Changed the tile color to yellow
                // ),
                ...widget.availableFoodTypes.map((type) => CheckboxListTile(
                  title: Text(type),
                  value: _selectedFoodTypes.contains(type),
                  onChanged: (bool? value) {
                    _toggleFoodType(type);
                  },
                  tileColor: Colors.yellow[100], // Changed the tile color to yellow
                )).toList(), // add toList() here
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort by Nearest Location',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.black, // Changed from default color to black
                  ),
                ),
                Switch(
                  value: _sortByNearestLocation,
                  onChanged: (value) {
                    setState(() {
                      _sortByNearestLocation = value;
                    });
                  },
                  activeColor: Colors.yellow[200], // Changed the active color to yellow
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _clearFilters,
                  child: Text('Clear Filter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(120, 40),
                  ),
                ),
                ElevatedButton(
                  onPressed: _applyFilters,
                  child: Text('Apply Filter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[500], // Changed the background color to yellow
                    foregroundColor: Colors.black, // Changed the foreground color to black
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(120, 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} // Changed the tile color to
