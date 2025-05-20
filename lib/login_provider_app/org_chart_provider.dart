import 'package:flutter/material.dart';
import 'org_chart_member.dart';

class OrgChartProvider with ChangeNotifier {
  List<OrgChartMember> _members = [];
  OrgChartMember? _selectedMember;
  final Map<String, List<OrgChartMember>> _reportees = {};

  List<OrgChartMember> get members => _members;
  OrgChartMember? get selectedMember => _selectedMember;

  List<OrgChartMember> get reporteesForSelected {
    if (_selectedMember == null || _selectedMember!.level > 0) return [];
    return _reportees[_selectedMember!.empCode] ?? [];
  }

  void selectMember(OrgChartMember member) {
    _selectedMember = member;
    notifyListeners();
  }

  void loadFromJson(Map<String, dynamic> json) {
    _members = [];

    final managers = json['data']['managers'] as List;
    managers.sort((a, b) => a['level'].compareTo(b['level']));
    _members.addAll(managers.map((e) => OrgChartMember(
      name: e['userName'],
      empCode: e['userId'],
      designation: e['designation'],
      department: e['department'],
      reporteeCount: int.tryParse(e['reportees'] ?? '0'),
      isManager: (e['reportees'] != null),
      level: e['level'] ?? 0,
    )));

    final selectedUser = json['data']['selectedUser'];
    final selected = OrgChartMember(
      name: selectedUser['userName'],
      empCode: selectedUser['userId'],
      designation: selectedUser['designation'],
      department: selectedUser['department'],
      reporteeCount: (json['data']['reportees'] as List).length,
      isManager: (json['data']['reportees'] as List).isNotEmpty,
      level: 0,
    );
    _members.add(selected);
    _selectedMember = selected;

    final reporteesList = json['data']['reportees'] as List;
    _reportees[selected.empCode] = reporteesList.map((e) => OrgChartMember(
      name: e['userName'],
      empCode: e['userId'],
      designation: e['designation'],
      department: e['department'],
      reporteeCount: int.tryParse(e['reportees'] ?? '0'),
      isManager: (e['reportees'] != null),
      level: 0,
    )).toList();

    notifyListeners();
  }
}
