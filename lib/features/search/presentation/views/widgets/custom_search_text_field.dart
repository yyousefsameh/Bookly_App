import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.suffixIcon,
    this.searchEditingController,
  });
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final TextEditingController? searchEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchEditingController,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search by category of books',
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
