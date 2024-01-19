import 'package:flutter/material.dart';
import 'package:parking_list/model/parking_list/result.dart';

class ParkingItem extends StatelessWidget {
  final Result parking;
  const ParkingItem({super.key, required this.parking});

  @override
  Widget build(BuildContext context) {
    return Text(parking.nombre!);
  }
}
