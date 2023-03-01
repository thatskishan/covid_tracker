import 'package:covid_tracker/views/covid_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => CovidTracker(),
    },
  ));
}
