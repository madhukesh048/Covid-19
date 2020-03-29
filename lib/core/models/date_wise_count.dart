// To parse this JSON data, do
//
//     final dateWiseCount = dateWiseCountFromJson(jsonString);

import 'dart:convert';

DateWiseCount dateWiseCountFromJson(String str) =>
    DateWiseCount.fromMap(json.decode(str));

String dateWiseCountToJson(DateWiseCount data) => json.encode(data.toMap());

class DateWiseCount {
  int count;
  Map<String, Result> result;

  DateWiseCount({
    this.count,
    this.result,
  });

  factory DateWiseCount.fromMap(Map<String, dynamic> json) => DateWiseCount(
        count: json["count"] == null ? null : json["count"],
        result: json["result"] == null
            ? null
            : Map.from(json["result"])
                .map((k, v) => MapEntry<String, Result>(k, Result.fromMap(v))),
      );

  Map<String, dynamic> toMap() => {
        "count": count == null ? null : count,
        "result": result == null
            ? null
            : Map.from(result)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
      };
}

class Result {
  int confirmed;
  int deaths;
  int recovered;

  Result({
    this.confirmed,
    this.deaths,
    this.recovered,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
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
