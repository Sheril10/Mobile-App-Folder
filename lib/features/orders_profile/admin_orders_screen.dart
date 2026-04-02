import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> {
  bool showUpdateSection = false;
  String currentStatus = 'Order Recieved';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('All Orders', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Order Id')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Payment')),
                        DataColumn(label: Text('Total')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text('53')),
                          DataCell(Text(currentStatus)),
                          const DataCell(Text('COD')),
                          const DataCell(Text('900')),
                          DataCell(GestureDetector(
                            onTap: () => setState(() => showUpdateSection = true),
                            child: const Text('Update\nStatus', style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue, fontSize: 12)),
                          )),
                        ]),
                      ],
                    ),
                  ),
                  if (showUpdateSection) _updateSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _updateSection() => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text('Update Status Order # 53', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
        const SizedBox(height: 10),
        DropdownButton<String>(
          value: currentStatus,
          isExpanded: true,
          items: ['Order Recieved', 'Order Booked', 'Order Dispatch', 'Delivered', 'Order Cancelled'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
          onChanged: (val) => setState(() { currentStatus = val!; showUpdateSection = false; }),
        ),
      ],
    ),
  );
}