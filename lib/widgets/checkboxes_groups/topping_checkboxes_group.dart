import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/pizza_toppings_provider.dart';
import 'package:yours_pizza/widgets/checkboxes/topping_checkbox.dart';

class ToppingCheckboxesGroup extends StatelessWidget {
  const ToppingCheckboxesGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final toppingsData = Provider.of<PizzaToppingsProvider>(
      context,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Toppings"),
        const SizedBox(
          height: 2,
        ),
        toppingsData.toppings == null
            ? const Text("Choose your pizza")
            : ListView.builder(
                shrinkWrap: true,
                itemCount: toppingsData.toppings?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final t = toppingsData.toppings![index];
                  return ToppingCheckbox(
                    value: t['checked'] as bool,
                    toppingPrice: t['price'] as int,
                    label: "${t['name'] as String} (\$${t['price']})",
                    id: t['name'] as String,
                  );
                },
              )
      ],
    );
  }
}
