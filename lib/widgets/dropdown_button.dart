import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';

const List<String> list = <String>['Hiking', 'Camping', 'Rumahan', 'Traveling'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      elevation: 16,
      style: blackTextStyle.copyWith(
        fontSize: 13,
        fontWeight: medium,
      ),
      underline: Container(
        height: 1,
        color: subtitleColor,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
