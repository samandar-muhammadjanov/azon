import 'package:azon/models/prayingTime.dart';
import 'package:azon/service/api.dart';
import 'package:flutter/material.dart';

class ProviderData extends ChangeNotifier {
  PrayingTime? prayingTime;

  fetchPrayingTime() async {
    prayingTime = await Api().prayingTime();
    notifyListeners();
  }
}
