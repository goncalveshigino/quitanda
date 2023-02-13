import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatter;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final GlobalKey<FormFieldState>? fromFieldKey;

  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.label,
      this.validator,
      this.isSecret = false,
      this.inputFormatter,
      this.initialValue,
      this.controller,
      this.onSaved,
      this.fromFieldKey,
      this.textInputType,
      this.readOnly = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        key: widget.fromFieldKey,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        obscureText: isObscure,
        onSaved: widget.onSaved,
        inputFormatters: widget.inputFormatter,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                  )
                : null,
            labelText: widget.label,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(18))),
      ),
    );
  }
}
