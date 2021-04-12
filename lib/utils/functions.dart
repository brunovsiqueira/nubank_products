import 'package:flutter/material.dart';

class Functions {
  static String getWelcomeMessage(TimeOfDay timeOfDay) {
    int hour = timeOfDay.hour;
    if (hour >= 5 && hour <= 11) {
      return "Good morning";
    } else if (hour >=12 && hour <= 16) {
      return "Good afternoon";
    } else {
      return "Good evening";
    }
  }
}