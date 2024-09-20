import 'package:flutter/material.dart';

class Filter {
  final List<String> priceRanges;
  final List<String> foodTypes;
  final bool sortByNearestLocation;


  Filter({required this.priceRanges, required this.foodTypes, required this.sortByNearestLocation,
  });
}
