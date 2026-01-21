import 'package:flutter/material.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''
• Aggregate roasting statistics
• Display roast counts and totals
• Show yield and loss trends
• Summarize bean usage
• Summarize cost efficiency
        ''',
      ),
    );
  }
}
