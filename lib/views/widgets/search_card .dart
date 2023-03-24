import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();

  SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 122, 58, 58),
            ),
          ),
          // enabledBorder: OutlineInputBorder(
          //   // borderSide: BorderSide(
          //   //   color: Colors.white,
          //   // ),
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          hintText: "Search",
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintStyle: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
      ),
    );
  }
}
