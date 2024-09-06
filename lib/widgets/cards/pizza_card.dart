import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/pizza_variant_provider.dart';

class PizzaCard extends StatelessWidget {
  const PizzaCard({
    super.key,
    required this.src,
    required this.title,
    required this.price,
    this.onSelected,
  });

  final String src;
  final String title;
  final int price;
  final void Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    final radioData = Provider.of<PizzaVariantProvider>(context);

    return Flexible(
      fit: FlexFit.tight,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(src),
            Text(title),
            Text("\$$price"),
            Radio<int>(
              value: price,
              groupValue: radioData.selectedOpts,
              onChanged: (val) {
                if (val == null) {
                  return;
                }

                radioData.changeSelected(val);

                if (onSelected != null) {
                  onSelected!();
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
