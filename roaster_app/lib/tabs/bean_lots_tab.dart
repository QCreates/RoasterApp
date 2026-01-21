import 'package:flutter/material.dart';

class BeanLotsTab extends StatelessWidget {
  const BeanLotsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''
• Track purchased bean lots
• Auto-increment lot ID
• Select associated bean type
• Store purchase date
• Store amount purchased
• Store total cost and invoice number
• Auto-calculate unit cost
• Track remaining balance per lot
• Maintain traceability between bean lots, roasts, and costs
        ''',
      ),
    );
  }
}
