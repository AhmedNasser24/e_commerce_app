import 'package:flutter/material.dart';

import '../../../../../utils/core/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.hintText, this.onChanged, this.validator, this.onTap,  this.readOnly = false, this.controller, this.suffixIcon, this.keyboardType,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final void Function()? onTap ;
  final bool readOnly;
  final TextEditingController? controller ;
  final Widget? suffixIcon ;
  final TextInputType? keyboardType ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Colors.white,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyle.regular14,  
        suffixIcon: suffixIcon,
        // fillColor: Colors.white,
        // focusColor: Colors.white,
        // hoverColor: Colors.white,
        
        focusedBorder: focusBorderDecoration(),
        enabledBorder: borderDecoration(),
        errorBorder: errorBorderDecoration(),
      ),
    );
  }

  OutlineInputBorder focusBorderDecoration() {
    return OutlineInputBorder(

      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 1.5),

    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(

      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 1),
    );
  }

  OutlineInputBorder errorBorderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    );
  }
}
