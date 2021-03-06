import 'package:budget_tracker_app/services/budget_service.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class CircularPercent extends StatelessWidget {
  const CircularPercent({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Consumer<BudgetService>(
        builder: (context, value, child) {
          return CircularPercentIndicator(
            radius: screenSize.width / 2,
            lineWidth: 10.0,
            percent: value.balance / value.budget,
            backgroundColor: Colors.white,
            center: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "\$" + value.balance.toString().split(".")[0],
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Balance",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Budget: \$" + value.budget.toString(), // <- here
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            progressColor: Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }
}
