import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String cryptoName;
  final String price;
  final double change;
  final IconData icon;
  final Color iconBackground;

  const CryptoCard({
    super.key,
    required this.cryptoName,
    required this.price,
    required this.change,
    required this.icon,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon background and icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconBackground.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconBackground),
              ),
              Text(
                change > 0
                    ? "+${change.toStringAsFixed(2)}"
                    : change.toStringAsFixed(1),
                style: TextStyle(
                  color: change > 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Change (green or red)
          const SizedBox(height: 4),
          // Crypto name
          Text(
            cryptoName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          // Price
          Text(
            price,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
