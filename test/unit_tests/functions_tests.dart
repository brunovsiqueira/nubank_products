import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubankproducts/utils/functions.dart';

void main() {
  group("getWelcomeMessage tests", () {
    test("getWelcomeMessage contains afternoon at 4:59pm", () {
      Functions.getWelcomeMessage(TimeOfDay(hour: 16, minute: 59)).contains("afternoon");
    });
    test("getWelcomeMessage contains evening at 7pm", () {
      Functions.getWelcomeMessage(TimeOfDay(hour: 19, minute: 0)).contains("evening");
    });
    test("getWelcomeMessage contains morning at 5am", () {
      Functions.getWelcomeMessage(TimeOfDay(hour: 7, minute: 0)).contains("morning");
    });
  });
}