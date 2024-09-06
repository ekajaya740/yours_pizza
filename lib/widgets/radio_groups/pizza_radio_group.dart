import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/pizza_toppings_provider.dart';
import 'package:yours_pizza/widgets/cards/pizza_card.dart';

class PizzaRadioGroup extends StatelessWidget {
  const PizzaRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pizza Variant"),
        Row(
          children: [
            PizzaCard(
              src: "assets/images/pizza-1.jpg",
              title: 'Pizza 1',
              price: 8,
              onSelected: () {
                Provider.of<PizzaToppingsProvider>(context, listen: false)
                    .setPizza1Topping();
              },
            ),
            PizzaCard(
              src: "assets/images/pizza-2.jpg",
              title: 'Pizza 2',
              price: 10,
              onSelected: () {
                Provider.of<PizzaToppingsProvider>(context, listen: false)
                    .setPizza2Topping();
              },
            ),
            PizzaCard(
              src: "assets/images/pizza-3.jpg",
              title: 'Pizza 3',
              price: 12,
              onSelected: () {
                Provider.of<PizzaToppingsProvider>(context, listen: false)
                    .setPizza3Topping();
              },
            ),
          ],
        ),
      ],
    );
  }
}
