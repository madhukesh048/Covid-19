// To parse this JSON data, do
//
//     final indiaData = indiaDataFromJson(jsonString);

import 'dart:convert';

IndiaData indiaDataFromJson(String str) => IndiaData.fromMap(json.decode(str));

String indiaDataToJson(IndiaData data) => json.encode(data.toMap());

class IndiaData {
    bool success;
    Data data;
    DateTime lastRefreshed;
    DateTime lastOriginUpdate;

    IndiaData({
        this.success,
        this.data,
        this.lastRefreshed,
        this.lastOriginUpdate,
    });

    factory IndiaData.fromMap(Map<String, dynamic> json) => IndiaData(
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
    Summary summary;
    List<Regional> regional;

    Data({
        this.summary,
        this.regional,
    });

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        summary: json["summary"] == null ? null : Summary.fromMap(json["summary"]),
        regional: json["regional"] == null ? null : List<Regional>.from(json["regional"].map((x) => Regional.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "summary": summary == null ? null : summary.toMap(),
        "regional": regional == null ? null : List<dynamic>.from(regional.map((x) => x.toMap())),
    };
}

class Regional {
    String loc;
    int confirmedCasesIndian;
    int confirmedCasesForeign;
    int discharged;
    int deaths;

    Regional({
        this.loc,
        this.confirmedCasesIndian,
        this.confirmedCasesForeign,
        this.discharged,
        this.deaths,
    });

    factory Regional.fromMap(Map<String, dynamic> json) => Regional(
        loc: json["loc"] == null ? null : json["loc"],
        confirmedCasesIndian: json["confirmedCasesIndian"] == null ? null : json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"] == null ? null : json["confirmedCasesForeign"],
        discharged: json["discharged"] == null ? null : json["discharged"],
        deaths: json["deaths"] == null ? null : json["deaths"],
    );

    Map<String, dynamic> toMap() => {
        "loc": loc == null ? null : loc,
        "confirmedCasesIndian": confirmedCasesIndian == null ? null : confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign == null ? null : confirmedCasesForeign,
        "discharged": discharged == null ? null : discharged,
        "deaths": deaths == null ? null : deaths,
    };
}

class Summary {
    int total;
    int confirmedCasesIndian;
    int confirmedCasesForeign;
    int discharged;
    int deaths;
    int confirmedButLocationUnidentified;

    Summary({
        this.total,
        this.confirmedCasesIndian,
        this.confirmedCasesForeign,
        this.discharged,
        this.deaths,
        this.confirmedButLocationUnidentified,
    });

    factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        total: json["total"] == null ? null : json["total"],
        confirmedCasesIndian: json["confirmedCasesIndian"] == null ? null : json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"] == null ? null : json["confirmedCasesForeign"],
        discharged: json["discharged"] == null ? null : json["discharged"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        confirmedButLocationUnidentified: json["confirmedButLocationUnidentified"] == null ? null : json["confirmedButLocationUnidentified"],
    );

    Map<String, dynamic> toMap() => {
        "total": total == null ? null : total,
        "confirmedCasesIndian": confirmedCasesIndian == null ? null : confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign == null ? null : confirmedCasesForeign,
        "discharged": discharged == null ? null : discharged,
        "deaths": deaths == null ? null : deaths,
        "confirmedButLocationUnidentified": confirmedButLocationUnidentified == null ? null : confirmedButLocationUnidentified,
    };
}
