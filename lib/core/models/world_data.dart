// To parse this JSON data, do
//
//     final worldData = worldDataFromJson(jsonString);

import 'dart:convert';

class WorldData {
  final int cases;
  final int deaths;
  final int recovered;
  final int updated;
  final int active;

  WorldData({
    this.cases,
    this.deaths,
    this.recovered,
    this.updated,
    this.active,
  });

  WorldData copyWith({
    int cases,
    int deaths,
    int recovered,
    int updated,
    int active,
  }) =>
      WorldData(
        cases: cases ?? this.cases,
        deaths: deaths ?? this.deaths,
        recovered: recovered ?? this.recovered,
        updated: updated ?? this.updated,
        active: active ?? this.active,
      );

  factory WorldData.fromJson(String str) => WorldData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WorldData.fromMap(Map<String, dynamic> json) => WorldData(
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        updated: json["updated"] == null ? null : json["updated"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toMap() => {
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
        "updated": updated == null ? null : updated,
        "active": active == null ? null : active,
      };
}
