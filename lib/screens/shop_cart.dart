import 'package:flutter/material.dart';
// import 'package:flutter_tableview/flutter_tableview.dart';

class ShopCart extends StatefulWidget {
  const ShopCart({super.key});

  @override
  State<ShopCart> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> studentsData = [
    {"name": "iPhone14", "Screen Size": '5.6 inch', "place": "New York", "standard": 5, "rollNumber": 101},
    {"name": "iPhone14pro", "Screen Size": '6.0 inch', "place": "Los Angeles", "standard": 5, "rollNumber": 102},
    {"name": "iPhone13pro", "Screen Size": '5.5 inch', "place": "Chicago", "standard": 5, "rollNumber": 103},
    {"name": "iPhone13", "Screen Size": '5.3 inch', "place": "Houston", "standard": 6, "rollNumber": 201},
    {"name": "iPhoneMini", "Screen Size": '5 inch', "place": "San Francisco", "standard": 6, "rollNumber": 202},
    {"name": "iPhone12", "Screen Size": '5.5 inch', "place": "Seattle", "standard": 6, "rollNumber": 203},
    {"name": "iPhone12pro", "Screen Size": '6 inch', "place": "Miami", "standard": 6, "rollNumber": 204},
  ];

 late List<Map<String, dynamic>> filteredStudents;

  void filterStudents(String query) {
    setState(() {
      filteredStudents = studentsData
          .where((student) => student['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    filteredStudents = List.from(studentsData); // Initialize filteredStudents with the initial data.
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back,color: Colors.amber,),
                  const SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 200,
                    child: TextField(
                      
                      controller: _searchController,
                      keyboardType: TextInputType.text,
                      onChanged: filterStudents,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        hintText: 'Search products',
                      ),
                      autofocus: false,
                    ),
                  ),
                ],
              ),
           Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                _buildFixedColumn(),
                _buildScrollableDataTable(),
              ],
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
Widget _buildFixedColumn() {
  return Container(
    width: 130, // Adjust the width of the fixed column as needed.
    decoration: BoxDecoration(
      border: Border(right: BorderSide(color: Colors.grey)),
    ),
    child: SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('')),
        ],
        rows: filteredStudents.map((student) {
          return DataRow(cells: [
            DataCell(Text(student['name'])),
          ]);
        }).toList(),
      ),
    ),
  );
}

  Widget _buildScrollableDataTable() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Screen Size')),
            DataColumn(label: Text('Place')),
            DataColumn(label: Text('Standard')),
            DataColumn(label: Text('Roll Number')),
          ],
          rows: filteredStudents.map((student) {
            return DataRow(cells: [
              DataCell(Text(student['Screen Size'].toString())),
              DataCell(Text(student['place'])),
              DataCell(Text(student['standard'].toString())),
              DataCell(Text(student['rollNumber'].toString())),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}






