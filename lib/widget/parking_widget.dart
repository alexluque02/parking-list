import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parking_list/model/parking_list/parking_list.dart';
import 'package:parking_list/screen/home_screen.dart';

Future<ParkingList> fetchParking() async {
  final response = await http.get(Uri.parse(
      'https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/parkings/records?limit=99'));

  if (response.statusCode == 200) {
    return ParkingList.fromJson(response.body);
  } else {
    throw Exception('Failed to load de Parking');
  }
}

class ParkingWidget extends StatefulWidget {
  const ParkingWidget({super.key});

  @override
  State<ParkingWidget> createState() => _ParkingWidgetState();
}

class _ParkingWidgetState extends State<ParkingWidget> {
  late Future<ParkingList> parkingList;

  @override
  void initState() {
    super.initState();
    parkingList = fetchParking();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<ParkingList>(
          future: parkingList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen(parkingList: snapshot.data!.results!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
