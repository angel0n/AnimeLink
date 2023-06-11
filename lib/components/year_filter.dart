import 'package:flutter/material.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';

class YearFilter extends StatefulWidget {
  final int year;
  final void Function(String?) onChanged;
  const YearFilter({super.key, required this.year, required this.onChanged});

  @override
  State<YearFilter> createState() => _YearFilterState();
}

class _YearFilterState extends State<YearFilter> {
  @override
  Widget build(BuildContext context) {
    return DropdownDatePicker(
      inputDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textStyle: const TextStyle(
        fontSize: 25
      ),
      showDay: false,
      showMonth: false,
      selectedYear: widget.year,
      isDropdownHideUnderline: true, // optional
      isFormValidator: true, // optional
      startYear: 1957, // optional
      endYear: DateTime.now().year, // optional
      onChangedYear: widget.onChanged,
    );
  }
}
