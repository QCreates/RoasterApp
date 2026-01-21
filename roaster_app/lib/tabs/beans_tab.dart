import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BeansTab extends StatefulWidget {
  const BeansTab({super.key});

  @override
  State<BeansTab> createState() => _BeansTabState();
}

class _BeansTabState extends State<BeansTab> {
  int _nextBeanTypeId = 1;

  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _originInfoController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  bool _isActive = true;

  final List<Map<String, dynamic>> _beans = [];

  @override
  void initState() {
    super.initState();
    _loadBeans();
  }

  Future<File> _beanFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/beantypes.json');
  }

  Future<void> _loadBeans() async {
    final file = await _beanFile();

    if (!await file.exists()) {
      await file.writeAsString('[]');
    }

    final content = await file.readAsString();
    final List data = jsonDecode(content);

    setState(() {
      _beans
        ..clear()
        ..addAll(data.cast<Map<String, dynamic>>());

      if (_beans.isNotEmpty) {
        _nextBeanTypeId =
            _beans.map((b) => b['beanTypeId'] as int).reduce((a, b) => a > b ? a : b) + 1;
      }
    });
  }

  Future<void> _saveBeans() async {
    final file = await _beanFile();
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(_beans),
    );
  }

  Future<void> _addBean() async {
    if (_supplierController.text.isEmpty ||
        _originInfoController.text.isEmpty ||
        _countryController.text.isEmpty) {
      return;
    }

    setState(() {
      _beans.add({
        'beanTypeId': _nextBeanTypeId,
        'supplier': _supplierController.text,
        'originInfo': _originInfoController.text,
        'country': _countryController.text,
        'active': _isActive,
      });

      _nextBeanTypeId++;

      _supplierController.clear();
      _originInfoController.clear();
      _countryController.clear();
      _isActive = true;
    });

    await _saveBeans();
  }

  Future<void> _editBean(Map<String, dynamic> bean) async {
    final supplier = TextEditingController(text: bean['supplier']);
    final origin = TextEditingController(text: bean['originInfo']);
    final country = TextEditingController(text: bean['country']);
    bool active = bean['active'];

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Bean Type'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: supplier, decoration: const InputDecoration(labelText: 'Supplier')),
              TextField(controller: origin, decoration: const InputDecoration(labelText: 'Origin Info')),
              TextField(controller: country, decoration: const InputDecoration(labelText: 'Country')),
              SwitchListTile(
                title: const Text('Active'),
                value: active,
                onChanged: (v) => active = v,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                bean['supplier'] = supplier.text;
                bean['originInfo'] = origin.text;
                bean['country'] = country.text;
                bean['active'] = active;
              });
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    await _saveBeans();
  }

  Future<void> _deleteBean(Map<String, dynamic> bean) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Bean Type'),
        content: const Text('This action cannot be undone. Are you sure?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _beans.remove(bean);
      });
      await _saveBeans();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // Input row
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _supplierController,
                  decoration: const InputDecoration(labelText: 'Supplier'),
                ),
              ),
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _originInfoController,
                  decoration: const InputDecoration(labelText: 'Origin Info'),
                ),
              ),
              SizedBox(
                width: 120,
                child: TextField(
                  controller: _countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Active'),
                  Switch(value: _isActive, onChanged: (v) => setState(() => _isActive = v)),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, size: 32),
                onPressed: _addBean,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Table
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 24,
                  horizontalMargin: 12,
                  headingRowHeight: 44,
                  dataRowMinHeight: 44,
                  dataRowMaxHeight: 56,
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Supplier')),
                    DataColumn(label: Text('Origin')),
                    DataColumn(label: Text('Country')),
                    DataColumn(label: Text('Active')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: _beans.map((bean) {
                    return DataRow(cells: [
                      DataCell(Text(bean['beanTypeId'].toString())),
                      DataCell(Text(bean['supplier'])),
                      DataCell(Text(bean['originInfo'])),
                      DataCell(Text(bean['country'])),
                      DataCell(
                        Switch(
                          value: bean['active'],
                          onChanged: (v) async {
                            setState(() => bean['active'] = v);
                            await _saveBeans();
                          },
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _editBean(bean),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteBean(bean),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
