// To parse this JSON data, do
//
//     final indiaDataUnOff = indiaDataUnOffFromJson(jsonString);

import 'dart:convert';

IndiaDataUnOff indiaDataUnOffFromJson(String str) => IndiaDataUnOff.fromMap(json.decode(str));

String indiaDataUnOffToJson(IndiaDataUnOff data) => json.encode(data.toMap());

class IndiaDataUnOff {
    bool success;
    Data data;
    DateTime lastRefreshed;
    DateTime lastOriginUpdate;

    IndiaDataUnOff({
        this.success,
        this.data,
        this.lastRefreshed,
        this.lastOriginUpdate,
    });

    factory IndiaDataUnOff.fromMap(Map<String, dynamic> json) => IndiaDataUnOff(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        lastRefreshed: json["lastRefreshed"] == null ? null : DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: json["lastOriginUpdate"] == null ? null : DateTime.parse(json["lastOriginUpdate"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toMap(),
        "lastRefreshed": lastRefreshed == null ? null : lastRefreshed.toIso8601String(),
        "lastOriginUpdate": lastOriginUpdate == null ? null : lastOriginUpdate.toIso8601String(),
    };
}

class Data {
    String source;
    DateTime lastRefreshed;
    Total total;
    List<Total> statewise;

    Data({
        this.source,
        this.lastRefreshed,
        this.total,
        this.statewise,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        source: json["source"] == null ? null : json["source"],
        lastRefreshed: json["lastRefreshed"] == null ? null : DateTime.parse(json["lastRefreshed"]),
        total: json["total"] == null ? null : Total.fromMap(json["total"]),
        statewise: json["statewise"] == null ? null : List<Total>.from(json["statewise"].map((x) => Total.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "source": source == null ? null : source,
        "lastRefreshed": lastRefreshed == null ? null : lastRefreshed.toIso8601String(),
        "total": total == null ? null : total.toMap(),
        "statewise": statewise == null ? null : List<dynamic>.from(statewise.map((x) => x.toMap())),
    };
}

class Total {
    String state;
    int confirmed;
    int recovered;
    int deaths;
    int active;

    Total({
        this.state,
        this.confirmed,
        this.recovered,
        this.deaths,
        this.active,
    });

    factory Total.fromMap(Map<String, dynamic> json) => Total(
        state: json["state"] == null ? null : json["state"],
        confirmed: json["confirmed"] == null ? null : json["confirmed"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        active: json["active"] == null ? null : json["active"],
    );

    Map<String, dynamic> toMap() => {
        "state": state == null ? null : state,
        "confirmed": confirmed == null ? null : confirmed,
        "recovered": recovered == null ? null : recovered,
        "deaths": deaths == null ? null : deaths,
        "active": active == null ? null : active,
    };
}
