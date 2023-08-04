import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({Key? key}) : super(key: key);

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<Map<String, dynamic>> data = [
    {
      "Name": "Anjana",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Nilam",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Nilam",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Shreya",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Rina",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Vaishali",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Vaishali",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Chirag",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Nikita",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Zalak",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Zalak",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Ankita",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Ankita",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Chirag",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Rohit",
      "Age": "28",
      "Number": 9978391369,
      "Education": "Computer Engg.",
      "Hobby": "Travelling",
      "City": "Surat"
    },
    {
      "Name": "Trisha",
      "Age": "22",
      "Number": 9845631254,
      "Education": "B-Com",
      "Hobby": "Reading",
      "City": "Surat"
    },
    {
      "Name": "Nilesh",
      "Age": "22",
      "Number": 9845631254,
      "Education": "B-Com",
      "Hobby": "Reading",
      "City": "Surat"
    },
    {
      "Name": "Shreya",
      "Age": "22",
      "Number": 9845631254,
      "Education": "B-Com",
      "Hobby": "Reading",
      "City": "Surat"
    },
    {
      "Name": "Nisha",
      "Age": "22",
      "Number": 9845631254,
      "Education": "B-Com",
      "Hobby": "Reading",
      "City": "Surat"
    },
    {
      "Name": "Chintu",
      "Age": "22",
      "Number": 9845631254,
      "Education": "B-Com",
      "Hobby": "Reading",
      "City": "Surat"
    },
    {
      "Name": "Neha",
      "Age": "22",
      "Number": 9845631254,
      "Education": "B-Com",
      "Hobby": "Reading",
      "City": "Surat"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var columnlength = data.first.keys.toList();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                DataTable(
                  border: TableBorder.all(
                      color: Colors.teal,
                      width: 2,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  headingRowColor:
                      MaterialStateProperty.all(Colors.teal.shade200),
                  headingRowHeight: 70,
                  dataRowHeight: 50,
                  dataRowColor: MaterialStateProperty.all(Colors.pink.shade200),
                  columns: List.generate(
                      columnlength.length,
                      (index) =>
                          DataColumn(label: Text("${columnlength[index]}"))),
                  rows: List.generate(
                    data.length,
                    (index) => DataRow(
                      cells: List.generate(
                        columnlength.length,
                        (indes) => DataCell(
                          Text("${data[index]["${columnlength[indes]}"]}"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
