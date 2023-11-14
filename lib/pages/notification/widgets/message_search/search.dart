import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        cursorHeight: 12,
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          hintText: '搜索...',
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 101, 101, 101), fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
          ),
          // prefixIconConstraints: const BoxConstraints.tightFor(width: 44),
        ),
      ),
    );
  }
}
