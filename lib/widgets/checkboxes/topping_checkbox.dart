import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/pizza_toppings_provider.dart';

class ToppingCheckbox extends StatelessWidget {
  const ToppingCheckbox({
    super.key,
    required this.value,
    required this.toppingPrice,
    required this.label,
    required this.id,
  });

  final bool value;
  final int toppingPrice;
  final String label;
  final String id;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PizzaToppingsProvider>(context);
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (val) {
            if (val != null) {
              provider.setChecked(id, val);
            }
          },
        ),
        const SizedBox(
          width: 4,
        ),
        Text(label),
      ],
    );
  }
}
