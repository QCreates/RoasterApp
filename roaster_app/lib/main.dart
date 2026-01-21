import 'package:flutter/material.dart';

import 'navigation/app_section.dart';

import 'tabs/beans_tab.dart';
import 'tabs/roast_sessions_tab.dart';
import 'tabs/bean_lots_tab.dart';
import 'tabs/costs_tab.dart';
import 'tabs/maintenance_tab.dart';
import 'tabs/stats_tab.dart';

void main() {
  runApp(const RoasterApp());
}

class RoasterApp extends StatelessWidget {
  const RoasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roaster App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppSection _currentSection = AppSection.beans;

  Widget _buildContent() {
    switch (_currentSection) {
      case AppSection.beans:
        return const BeansTab();

      case AppSection.roastSessions:
        return const RoastSessionsTab();

      case AppSection.beanLots:
        return const BeanLotsTab();

      case AppSection.costs:
        return const CostsTab();

      case AppSection.maintenance:
        return const MaintenanceTab();

      case AppSection.stats:
        return const StatsTab();
    }
  }

  String _titleForSection() {
    switch (_currentSection) {
      case AppSection.beans:
        return 'Beans';
      case AppSection.roastSessions:
        return 'Roast Sessions';
      case AppSection.beanLots:
        return 'Bean Lots';
      case AppSection.costs:
        return 'Costs';
      case AppSection.maintenance:
        return 'Maintenance';
      case AppSection.stats:
        return 'Stats';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleForSection()),
        actions: [
          PopupMenuButton<AppSection>(
            onSelected: (section) {
              setState(() {
                _currentSection = section;
              });
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: AppSection.roastSessions,
                child: Text('Roast Sessions'),
              ),
              PopupMenuItem(
                value: AppSection.beans,
                child: Text('Beans'),
              ),
              PopupMenuItem(
                value: AppSection.beanLots,
                child: Text('Bean Lots'),
              ),
              PopupMenuItem(
                value: AppSection.costs,
                child: Text('Costs'),
              ),
              PopupMenuItem(
                value: AppSection.maintenance,
                child: Text('Maintenance'),
              ),
              PopupMenuItem(
                value: AppSection.stats,
                child: Text('Stats'),
              ),
            ],
          ),
        ],
      ),
      body: _buildContent(),
    );
  }
}
