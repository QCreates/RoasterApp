import 'package:flutter/material.dart';

class BeansTab extends StatelessWidget {
  const BeansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''
• Manage bean types
• Store supplier and origin information
• Mark bean types as active or inactive
• Only active beans appear in roast session dropdowns
• Link bean types to purchased bean lots
        ''',
      ),
    );
  }
}
