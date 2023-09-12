import 'package:flutter/material.dart';


final List<String> user = ['Parent', 'Attendance service','Teacher' ,'Admin'];

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropdownValue = user.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
        initialSelection: user.first,
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
      dropdownMenuEntries: user.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),

    );
  }
}
