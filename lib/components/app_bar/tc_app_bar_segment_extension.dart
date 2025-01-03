import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TCAppBarSegmentExtension extends StatefulWidget {
  final String selectedCategory;
  final List<String> segments;
  final Function(String) onSelect;
  const TCAppBarSegmentExtension({super.key, required this.selectedCategory, required this.segments, required this.onSelect});

  @override
  State<TCAppBarSegmentExtension> createState() => _TCAppBarSegmentExtensionState();
}

class _TCAppBarSegmentExtensionState extends State<TCAppBarSegmentExtension> {
  String selectedCategory ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCategory = widget.selectedCategory;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0)),
        child: SegmentedButton<String>(
          showSelectedIcon: false,
          onSelectionChanged: (value){
            setState(() {
              selectedCategory = value.first;
              widget.onSelect(selectedCategory);
            });
          },
          segments: List.generate(
            widget.segments.length, (index) {
            return ButtonSegment<String>(
              value: widget.segments[index],
              label: Text(widget.segments[index]),
            );
          },
          ), selected: {selectedCategory},
        )
    );
  }
}