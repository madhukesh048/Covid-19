// To parse this JSON data, do
//
//     final historicalCountryData = historicalCountryDataFromJson(jsonString);

import 'dart:convert';

class HistoricalCountryData {
    final String country;
    final String province;
    final Timeline timeline;

    HistoricalCountryData({
        this.country,
        this.province,
        this.timeline,
    });

    HistoricalCountryData copyWith({
        String country,
        String province,
        Timeline timeline,
    }) => 
        HistoricalCountryData(
            country: country ?? this.country,
            province: province ?? this.province,
            timeline: timeline ?? this.timeline,
        );

    factory HistoricalCountryData.fromJson(String str) => HistoricalCountryData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HistoricalCountryData.fromMap(Map<String, dynamic> json) => HistoricalCountryData(
        country: json["country"] == null ? null : json["country"],
        province: json["province"] == null ? null : json["province"],
        timeline: json["timeline"] == null ? null : Timeline.fromMap(json["timeline"]),
    );

    Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "province": province == null ? null : province,
        "timeline": timeline == null ? null : timeline.toMap(),
    };
}

class Timeline {
    final Map<String, int> cases;
    final Map<String, int> deaths;

    Timeline({
        this.cases,
        this.deaths,
    });

    Timeline copyWith({
        Map<String, int> cases,
        Map<String, int> deaths,
    }) => 
        Timeline(
            cases: cases ?? this.cases,
            deaths: deaths ?? this.deaths,
        );

    factory Timeline.fromJson(String str) => Timeline.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Timeline.fromMap(Map<String, dynamic> json) => Timeline(
        cases: json["cases"] == null ? null : Map.from(json["cases"]).map((k, v) => MapEntry<String, int>(k, v)),
        deaths: json["deaths"] == null ? null : Map.from(json["deaths"]).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toMap() => {
        "cases": cases == null ? null : Map.from(cases).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "deaths": deaths == null ? null : Map.from(deaths).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}
