import 'package:flutter/material.dart';

import 'tabs/roast_sessions_tab.dart';
import 'tabs/beans_tab.dart';
import 'tabs/costs_tab.dart';
import 'tabs/stats_tab.dart';
import 'tabs/maintenance_tab.dart';

void main() {
  runApp(const RoasterApp());
}

class RoasterApp extends StatelessWidget {
  const RoasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainTabs(),
    );
  }
}

class MainTabs extends StatelessWidget {
  const MainTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tribal Coffee Roastery'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Roast Sessions'),
              Tab(text: 'Beans'),
              Tab(text: 'Costs'),
              Tab(text: 'Stats'),
              Tab(text: 'Maintenance'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RoastSessionsTab(),
            BeansTab(),
            CostsTab(),
            StatsTab(),
            MaintenanceTab(),
          ],
        ),
      ),
    );
  }
}
