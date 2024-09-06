import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yours_pizza/providers/total_price_provider.dart';
import 'package:yours_pizza/widgets/checkboxes_groups/topping_checkboxes_group.dart';
import 'package:yours_pizza/widgets/radio_groups/pizza_radio_group.dart';
import 'package:yours_pizza/widgets/radio_groups/size_radio_group.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = Provider.of<TotalPriceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Pizza"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Text("Total Price: \$${totalPrice.total}"),
          ],
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              PizzaRadioGroup(),
              SizedBox(
                height: 8,
              ),
              SizeRadioGroup(),
              SizedBox(
                height: 8,
              ),
              ToppingCheckboxesGroup(),
            ],
          ),
        ),
      ),
    );
  }
}
