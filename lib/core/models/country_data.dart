// To parse this JSON data, do
//
//     final countryData = countryDataFromJson(jsonString);

import 'dart:convert';

class CountryData {
    final String country;
    final CountryInfo countryInfo;
    final int cases;
    final int todayCases;
    final int deaths;
    final int todayDeaths;
    final int recovered;
    final int active;
    final int critical;
    final double casesPerOneMillion;
    final double deathsPerOneMillion;

    CountryData({
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
    });

    CountryData copyWith({
        String country,
        CountryInfo countryInfo,
        int cases,
        int todayCases,
        int deaths,
        int todayDeaths,
        int recovered,
        int active,
        int critical,
        double casesPerOneMillion,
        double deathsPerOneMillion,
    }) => 
        CountryData(
            country: country ?? this.country,
            countryInfo: countryInfo ?? this.countryInfo,
            cases: cases ?? this.cases,
            todayCases: todayCases ?? this.todayCases,
            deaths: deaths ?? this.deaths,
            todayDeaths: todayDeaths ?? this.todayDeaths,
            recovered: recovered ?? this.recovered,
            active: active ?? this.active,
            critical: critical ?? this.critical,
            casesPerOneMillion: casesPerOneMillion ?? this.casesPerOneMillion,
            deathsPerOneMillion: deathsPerOneMillion ?? this.deathsPerOneMillion,
        );

    factory CountryData.fromJson(String str) => CountryData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CountryData.fromMap(Map<String, dynamic> json) => CountryData(
        country: json["country"] == null ? null : json["country"],
        countryInfo: json["countryInfo"] == null ? null : CountryInfo.fromMap(json["countryInfo"]),
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null ? null : json["casesPerOneMillion"].toDouble(),
        deathsPerOneMillion: json["deathsPerOneMillion"] == null ? null : json["deathsPerOneMillion"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "country": country == null ? null : country,
        "countryInfo": countryInfo == null ? null : countryInfo.toMap(),
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": deaths == null ? null : deaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": recovered == null ? null : recovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion": casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion == null ? null : deathsPerOneMillion,
    };
}

class CountryInfo {
    final int id;
    final double lat;
    final double long;
    final String flag;
    final String iso3;
    final String iso2;

    CountryInfo({
        this.id,
        this.lat,
        this.long,
        this.flag,
        this.iso3,
        this.iso2,
    });

    CountryInfo copyWith({
        int id,
        double lat,
        double long,
        String flag,
        String iso3,
        String iso2,
    }) => 
        CountryInfo(
            id: id ?? this.id,
            lat: lat ?? this.lat,
            long: long ?? this.long,
            flag: flag ?? this.flag,
            iso3: iso3 ?? this.iso3,
            iso2: iso2 ?? this.iso2,
        );

    factory CountryInfo.fromJson(String str) => CountryInfo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CountryInfo.fromMap(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"] == null ? null : json["_id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        flag: json["flag"] == null ? null : json["flag"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        iso2: json["iso2"] == null ? null : json["iso2"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id == null ? null : id,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "flag": flag == null ? null : flag,
        "iso3": iso3 == null ? null : iso3,
        "iso2": iso2 == null ? null : iso2,
    };
}
