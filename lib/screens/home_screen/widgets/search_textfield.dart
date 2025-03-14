import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  //late TextEditingController _searchingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Поиск товаров',
          border: InputBorder.none,
        ),
      ),
    );
  }
}