import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/pizza_size_provider.dart';
import 'package:yours_pizza/widgets/cards/size_card.dart';

class SizeRadioGroup extends StatefulWidget {
  const SizeRadioGroup({super.key});

  @override
  State<SizeRadioGroup> createState() => _SizeRadioGroupState();
}

class _SizeRadioGroupState extends State<SizeRadioGroup> {
  @override
  Widget build(BuildContext context) {
    Provider.of<PizzaSizeProvider>(context, listen: false).setDefaultValue(0);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size Variant"),
        Row(
          children: [
            SizeCard(
              label: 'S (-\$1)',
              value: -1,
            ),
            SizeCard(
              label: 'M (\$0)',
              value: 0,
            ),
            SizeCard(
              label: 'L (+\$2)',
              value: 2,
            ),
          ],
        ),
      ],
    );
  }
}
