import 'package:flutter/material.dart';
import 'package:flutter3awancafe/presentations/viewmodels/cart_viewmodel.dart';
import 'package:flutter3awancafe/presentations/viewmodels/home_viewmodel.dart';
import 'package:flutter3awancafe/presentations/views/cart_view.dart';
import 'package:flutter3awancafe/presentations/views/home_view.dart';
import 'package:flutter3awancafe/presentations/views/order_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (_) => const HomeView(),
        '/cart': (_) => const CartView(),
        '/orders': (_) => const OrderView(),
      },
    );
  }
}
