import 'package:flutter/material.dart';
import 'package:my_app/widgets/bottomwidget.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Portfolio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade100,
              ),
              child: Row(
                children: [
                  Icon(Icons.add, size: 15),
                  Text(
                    'Add',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          spacing: 20,
          children: const [
            CryptoCard(
              cryptoName: 'BTC',
              price: '\$87,009',
              change: 2.33,
              icon: Icons.currency_bitcoin,
              iconBackground: Colors.blue,
            ),
            CryptoCard(
              cryptoName: 'ETH',
              price: '\$2,112',
              change: -15.3,
              icon: Icons.currency_exchange,
              iconBackground: Colors.orange,
            ),
          ],
        ),
      ],
    );
  }
}
