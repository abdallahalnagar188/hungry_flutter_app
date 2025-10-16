import 'package:flutter/material.dart';
import 'package:hungry_flutter_app/core/constance/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.validator,
    required this.controller,
    required this.isPassword,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      cursorHeight: 20,
      style: TextStyle(color: Colors.black),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        suffixIcon: widget.isPassword
            ? IconButton(onPressed: () => _togglePasswordVisibility(), icon: Icon(Icons.remove_red_eye))
            :  null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
