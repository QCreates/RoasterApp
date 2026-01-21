import 'package:flutter/material.dart';

class MaintenanceTab extends StatelessWidget {
  const MaintenanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        '''
• Log maintenance actions
• Track service dates and notes
• Store operational how-to documentation
• Store maintenance procedures
        ''',
      ),
    );
  }
}
