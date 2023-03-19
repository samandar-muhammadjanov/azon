import 'dart:convert';

import 'package:azon/models/prayingTime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<PrayingTime> prayingTime() async {
    final response = await http.get(
      Uri.parse("https://islomapi.uz/api/present/day?region=Toshkent"),
    );

    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200) {
      PrayingTime prayingTime = prayingimeFromJson(response.body);
      return prayingTime;
    } else {
      return throw Exception(response.statusCode);
    }
  }
}
