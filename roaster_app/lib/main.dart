import 'package:flutter/material.dart';

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

class RoastSessionsTab extends StatelessWidget {
  const RoastSessionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Roast Sessions'),
    );
  }
}

class BeansTab extends StatelessWidget {
  const BeansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bean Types'),
    );
  }
}

class CostsTab extends StatelessWidget {
  const CostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Costs'),
    );
  }
}

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Stats'),
    );
  }
}

class MaintenanceTab extends StatelessWidget {
  const MaintenanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Maintenance'),
    );
  }
}
