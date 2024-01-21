import 'package:flutter/material.dart';
import 'package:parking_list/model/parking_list/result.dart';

class ParkingItem extends StatelessWidget {
  final Result parking;
  const ParkingItem({super.key, required this.parking});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
              child: Image.network(
                'https://viajes.nationalgeographic.com.es/medio/2023/09/12/plaza-del-ayuntamiento-valencia_aa6b85c7_230912183353_800x800.jpg',
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parking.nombre!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Expanded(
                        child: Text(
                          parking.direccion!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  // Agrega aquí más widgets de texto u otros elementos según sea necesario.
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
