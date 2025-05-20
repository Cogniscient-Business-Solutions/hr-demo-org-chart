import 'package:flutter/material.dart';
import 'org_chart_member.dart';

class ReporteeGrid extends StatelessWidget {
  final List<OrgChartMember> reportees;

  const ReporteeGrid({Key? key, required this.reportees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reportees.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          final member = reportees[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, size: 25, color: member.isManager ? Colors.red : Colors.green),
                const SizedBox(height: 6),
                Text(member.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                Text(member.designation, style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                Text(member.department, style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis),
                const SizedBox(height: 6),
                if (member.isManager)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.groups, size: 14, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text('${member.reporteeCount}', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
