import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'org_chart_provider.dart';
import 'org_chart_cell.dart';
import 'mock_data.dart';

class OrgChartScreen extends StatelessWidget {
  const OrgChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrgChartProvider>(context);

    // Load JSON only once
    if (provider.members.isEmpty) {
      final decodedJson = jsonDecode(sampleJson);
      provider.loadFromJson(decodedJson);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Org Chart')),
      body: ListView.builder(
        itemCount: provider.members.length,
        itemBuilder: (context, index) {
          final member = provider.members[index];
          return OrgChartCell(member: member);
        },
      ),
    );
  }
}
