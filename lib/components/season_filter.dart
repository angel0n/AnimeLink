import 'package:anime_link/enuns/seasons.dart';
import 'package:flutter/material.dart';

class SeasonFilter extends StatefulWidget {
  final Seasons season;
  final void Function(String?) onChanged;
  
  const SeasonFilter({super.key, required this.season, required this.onChanged});

  @override
  State<SeasonFilter> createState() => _SeasonFilterState();
}

class _SeasonFilterState extends State<SeasonFilter> {
  
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.season.name;
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      padding: const EdgeInsets.all(8),
      alignment: AlignmentDirectional.centerEnd,
      onChanged: widget.onChanged,
      items: Seasons.values.map<DropdownMenuItem<String>>((Seasons value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}