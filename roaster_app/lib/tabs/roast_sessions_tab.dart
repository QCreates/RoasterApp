import 'package:flutter/material.dart';

class RoastSessionsTab extends StatelessWidget {
  const RoastSessionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''
• Start and end roast sessions
• Auto-number roasts sequentially
• Log date and time for each roast
• Select bean type used (default to most recent)
• Record green weight and post-roast weight
• Calculate and store roast loss percentage
• Track cooldown time only between roasts
• Maintain full traceability between roasts and bean lots
• Display session totals and individual roast entries
        ''',
      ),
    );
  }
}
