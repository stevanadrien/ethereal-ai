import 'package:flutter/material.dart';
import '../models/filter.dart';

class FilterBottomSheet extends StatefulWidget {
  final void Function(Filter filter) onFilterApplied;
  final List<String> availableFoodTypes; // Add this line

  FilterBottomSheet({
    required this.onFilterApplied,
    required this.availableFoodTypes, // Add this line
  });


  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
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
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Filter by Price Range',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
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
                ),
                CheckboxListTile(
                  title: Text('Rp.5000 - Rp.50.000'),
                  value: _selectedPriceRanges.contains('Rp.5000 - Rp.50.000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Rp.5000 - Rp.50.000');
                  },
                ),
                CheckboxListTile(
                  title: Text('Rp.50.000 - Rp.100.000'),
                  value: _selectedPriceRanges.contains('Rp.50.000 - Rp.100.000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Rp.50.000 - Rp.100.000');
                  },
                ),
                CheckboxListTile(
                  title: Text('Di atas Rp.100.000'),
                  value: _selectedPriceRanges.contains('Di atas Rp.100.000'),
                  onChanged: (bool? value) {
                    _togglePriceRange('Di atas Rp.100.000');
                  },
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
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                CheckboxListTile(
                  title: Text('Vegetarian'),
                  value: _selectedFoodTypes.contains('Vegetarian'),
                  onChanged: (bool? value) {
                    _toggleFoodType('Vegetarian');
                  },
                ),
                CheckboxListTile(
                  title: Text('Non-Vegetarian'),
                  value: _selectedFoodTypes.contains('Non-Vegetarian'),
                  onChanged: (bool? value) {
                    _toggleFoodType('Non-Vegetarian');
                  },
                ),
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
                  ),
                ),
                Switch(
                  value: _sortByNearestLocation,
                  onChanged: (value) {
                    setState(() {
                      _sortByNearestLocation = value;
                    });
                  },
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
                    backgroundColor: Color(0xFF0A6847),
                    foregroundColor: Colors.white,
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
}
