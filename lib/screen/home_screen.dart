import 'package:flutter/material.dart';
import 'package:parking_list/model/parking_list/result.dart';
import 'package:parking_list/widget/parking_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  final List<Result> parkingList;
  const HomeScreen({super.key, required this.parkingList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _enabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Parking List'),
        ),
        body: Skeletonizer(
          enabled: _enabled,
          child: ListView.builder(
            itemCount: widget.parkingList.length,
            itemBuilder: (context, index) {
              return ParkingItem(parking: widget.parkingList[index]);
            },
          ),
        ));
  }
}
