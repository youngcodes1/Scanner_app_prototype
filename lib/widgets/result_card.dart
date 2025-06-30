import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final bool isVerified;

  const ResultCard({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    final isSuccess = isVerified;
    final statusText = isSuccess ? "Product Verified" : "Unknown Product";
    final statusColor = isSuccess ? Colors.green : Colors.red;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.error,
                  color: statusColor,
                ),
                const SizedBox(width: 8),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 20,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Product: Celesthera Elixir"),
            const Text("Ingredients:Blue Tansy Oil, Tranexamic Acid, Tremella Mushroom"),
          ],
        ),
      ),
    );
  }
}
