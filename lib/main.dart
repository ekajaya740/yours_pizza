import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/pages/home_page.dart';
import 'package:yours_pizza/providers/pizza_size_provider.dart';
import 'package:yours_pizza/providers/pizza_toppings_provider.dart';
import 'package:yours_pizza/providers/pizza_variant_provider.dart';
import 'package:yours_pizza/providers/total_price_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PizzaVariantProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PizzaSizeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PizzaToppingsProvider(),
        ),
        ChangeNotifierProxyProvider3<PizzaVariantProvider, PizzaSizeProvider,
            PizzaToppingsProvider, TotalPriceProvider>(
          create: (BuildContext context) => TotalPriceProvider(),
          update: (BuildContext context,
                  PizzaVariantProvider value,
                  PizzaSizeProvider value2,
                  PizzaToppingsProvider value3,
                  TotalPriceProvider? previous) =>
              previous!
                ..setTotal(
                  value.selectedOpts ?? 0,
                  value2.selectedOpts ?? 0,
                  value3.toppingsValue,
                ),
        )
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
      title: 'Pizza App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
