import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/order_status_screen.dart';

void main() => runApp(const FoodApp());

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const CategoryScreen(),
      routes: {
        '/orderStatus': (context) => const OrderStatusScreen(),
      },
    );
  }
}