import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/pizza_size_provider.dart';
import 'package:yours_pizza/providers/pizza_variant_provider.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({super.key, required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final sizeData = Provider.of<PizzaSizeProvider>(context);

    return Flexible(
      fit: FlexFit.tight,
      child: Card(
        child: Column(
          children: [
            Text(label),
            Radio(
              value: value,
              groupValue: sizeData.selectedOpts,
              onChanged: (val) {
                if (val == null) {
                  return;
                }

                sizeData.changeSelected(val);
              },
            )
          ],
        ),
      ),
    );
  }
}
