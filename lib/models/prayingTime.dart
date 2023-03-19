// To parse this JSON data, do
//
//     final prayingime = prayingimeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PrayingTime prayingimeFromJson(String str) => PrayingTime.fromJson(json.decode(str));

String prayingimeToJson(PrayingTime data) => json.encode(data.toJson());

class PrayingTime {
    PrayingTime({
        required this.region,
        required this.date,
        required this.weekday,
        required this.times,
    });

    String region;
    DateTime date;
    String weekday;
    Times times;

    factory PrayingTime.fromJson(Map<String, dynamic> json) => PrayingTime(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"],
        times: Times.fromJson(json["times"]),
    );

    Map<String, dynamic> toJson() => {
        "region": region,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "weekday": weekday,
        "times": times.toJson(),
    };
}

class Times {
    Times({
        required this.tongSaharlik,
        required this.quyosh,
        required this.peshin,
        required this.asr,
        required this.shomIftor,
        required this.hufton,
    });

    String tongSaharlik;
    String quyosh;
    String peshin;
    String asr;
    String shomIftor;
    String hufton;

    factory Times.fromJson(Map<String, dynamic> json) => Times(
        tongSaharlik: json["tong_saharlik"],
        quyosh: json["quyosh"],
        peshin: json["peshin"],
        asr: json["asr"],
        shomIftor: json["shom_iftor"],
        hufton: json["hufton"],
    );

    Map<String, dynamic> toJson() => {
        "tong_saharlik": tongSaharlik,
        "quyosh": quyosh,
        "peshin": peshin,
        "asr": asr,
        "shom_iftor": shomIftor,
        "hufton": hufton,
    };
}
