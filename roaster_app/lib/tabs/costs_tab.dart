import 'package:flutter/material.dart';

class CostsTab extends StatelessWidget {
  const CostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''
• Track purchased bean lots
• Auto-increment bean lot ID
• Store purchase date, quantity, and total cost
• Auto-calculate unit cost
• Track remaining balance per lot
• Log cost per 12oz bag
• Log cost per 5lb bag
• Maintain historical cost records tied to bean lot ID
        ''',
      ),
    );
  }
}
