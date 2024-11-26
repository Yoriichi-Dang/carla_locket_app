import 'package:carla_locket_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final Icon icon;
  final bool obscure;
  final String typeKeyboard;
  const InputField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.typeKeyboard = 'text',
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.typeKeyboard == 'email'
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: const TextStyle(
          color: Colors.white, fontSize: 16, fontFamily: 'Roboto'),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 22),
        hintStyle: TextStyle(color: Colors.grey.shade400),
        hintText: widget.hint,
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: widget.icon),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        suffixIcon: widget.obscure
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
      obscureText: widget.obscure && !showPassword,
    );
  }
}
