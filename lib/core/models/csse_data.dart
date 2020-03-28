// To parse this JSON data, do
//
//     final csseData = csseDataFromJson(jsonString);

import 'dart:convert';

class CsseData {
    final String country;
    final String province;
    final DateTime updatedAt;
    final Stats stats;
    final Coordinates coordinates;

    CsseData({
        this.country,
        this.province,
        this.updatedAt,
        this.stats,
        this.coordinates,
    });

    CsseData copyWith({
        String country,
        String province,
        DateTime updatedAt,
        Stats stats,
        Coordinates coordinates,
    }) => 
        CsseData(
            country: country ?? this.country,
            province: province ?? this.province,
            updatedAt: updatedAt ?? this.updatedAt,
            stats: stats ?? this.stats,
            coordinates: coordinates ?? this.coordinates,
        );

    factory CsseData.fromJson(String str) => CsseData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CsseData.fromMap(Map<String, dynamic> json) => CsseData(
        country: json["country"] == null ? null : json["country"],
        province: json["province"] == null ? null : json["province"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        stats: json["stats"] == null ? null : Stats.fromMap(json["stats"]),
        coordinates: json["coordinates"] == null ? null : Coordinates.fromMap(json["coordinates"]),
    );

    Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "province": province == null ? null : province,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "stats": stats == null ? null : stats.toMap(),
        "coordinates": coordinates == null ? null : coordinates.toMap(),
    };
}

class Coordinates {
    final String latitude;
    final String longitude;

    Coordinates({
        this.latitude,
        this.longitude,
    });

    Coordinates copyWith({
        String latitude,
        String longitude,
    }) => 
        Coordinates(
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );

    factory Coordinates.fromJson(String str) => Coordinates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
    };
}

class Stats {
    final int confirmed;
    final int deaths;
    final int recovered;

    Stats({
        this.confirmed,
        this.deaths,
        this.recovered,
    });

    Stats copyWith({
        int confirmed,
        int deaths,
        int recovered,
    }) => 
        Stats(
            confirmed: confirmed ?? this.confirmed,
            deaths: deaths ?? this.deaths,
            recovered: recovered ?? this.recovered,
        );

    factory Stats.fromJson(String str) => Stats.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stats.fromMap(Map<String, dynamic> json) => Stats(
        confirmed: json["confirmed"] == null ? null : json["confirmed"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
    );

    Map<String, dynamic> toMap() => {
        "confirmed": confirmed == null ? null : confirmed,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
    };
}
