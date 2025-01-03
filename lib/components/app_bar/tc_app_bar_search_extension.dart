import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TcAppBarSearchExtension extends StatelessWidget {
  final Function(String) filterPeople;
  final String searchText;
  const TcAppBarSearchExtension({super.key, required this.searchText, required this.filterPeople});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0)),
      child: TextFormField(
        onChanged: (value){
          filterPeople(value);
        },
        decoration: InputDecoration(
          labelText: searchText,
          border: InputBorder.none,
          icon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.search)),
        ),
      ),
    );
  }
}
