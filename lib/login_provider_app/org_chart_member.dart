class OrgChartMember {
  final String name;
  final String empCode;
  final String designation;
  final String department;
  final int? reporteeCount;
  final bool isManager;
  final int level;

  OrgChartMember({
    required this.name,
    required this.empCode,
    required this.designation,
    required this.department,
    this.reporteeCount,
    this.isManager = false,
    this.level = 0,
  });
}
