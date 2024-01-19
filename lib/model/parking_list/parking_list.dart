import 'dart:convert';

import 'result.dart';

class ParkingList {
  int? totalCount;
  List<Result>? results;

  ParkingList({this.totalCount, this.results});

  factory ParkingList.fromMap(Map<String, dynamic> data) => ParkingList(
        totalCount: data['total_count'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'total_count': totalCount,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ParkingList].
  factory ParkingList.fromJson(String data) {
    return ParkingList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ParkingList] to a JSON string.
  String toJson() => json.encode(toMap());
}
