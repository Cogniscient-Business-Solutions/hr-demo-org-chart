import 'package:flutter/material.dart';
import 'org_chart_member.dart';
import 'package:provider/provider.dart';
import 'org_chart_provider.dart';
import 'reportee_grid.dart';

class OrgChartCell extends StatefulWidget {
  final OrgChartMember member;

  const OrgChartCell({Key? key, required this.member}) : super(key: key);

  @override
  _OrgChartCellState createState() => _OrgChartCellState();
}

class _OrgChartCellState extends State<OrgChartCell> {
  bool _showReportees = false;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<OrgChartProvider>(context, listen: false);

    final isSelected = provider.selectedMember == widget.member;
    final isManagerWithReportees = widget.member.isManager && widget.member.level == 0;

    if (isSelected && isManagerWithReportees) {
      _showReportees = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrgChartProvider>(context);
    final isSelected = provider.selectedMember == widget.member;
    final isManagerWithReportees = widget.member.isManager && widget.member.level == 0;

    return GestureDetector(
      onTap: () {
        provider.selectMember(widget.member);
        if (isManagerWithReportees) {
          setState(() {
            _showReportees = !_showReportees;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.member.isManager ? Colors.green.shade100 : Colors.blue.shade100,
                      child: Icon(Icons.person, color: widget.member.isManager ? Colors.green : Colors.blue),
                    ),
                    if (widget.member.isManager)
                      Column(
                        children: [
                          const SizedBox(height: 4),
                          provider.selectedMember == widget.member
                              ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue.shade100,
                            ),
                            child: const Icon(Icons.remove_red_eye, size: 16, color: Colors.blue),
                          )
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.groups, size: 16, color: Colors.blue),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.member.reporteeCount ?? 0}',
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),

                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.member.name} (${widget.member.empCode})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(widget.member.designation),
                      Text(widget.member.department),
                    ],
                  ),
                ),
                if (!widget.member.isManager)
                  const Icon(Icons.remove_red_eye, size: 24, color: Colors.blue),
              ],
            ),
            if (isSelected && isManagerWithReportees && _showReportees)
              Column(
                children: [
                  const SizedBox(height: 8),
                  ReporteeGrid(reportees: provider.reporteesForSelected),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

