import 'package:appads/view/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color(0xFF1E1E1E),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF1E1E1E),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Color(0xFF979797),
            ),
          ),
          primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
