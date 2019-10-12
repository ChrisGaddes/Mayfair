import 'package:flutter/material.dart';
import 'package:mayfair/app/landing_page.dart';
import 'package:mayfair/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      builder: (context) => Auth(),
      child: MaterialApp(
        title: 'Mayfair',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
  }
}
