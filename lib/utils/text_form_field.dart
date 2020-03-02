import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';

class CustomTextFormField extends StatelessWidget {
  final IconButton icon;
  final String hintText;
  final IconButton suffixIcon;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final Function inputValidator;
  final Function onFieldSubmitted;
  final EdgeInsets contentPadding;
  final int maxLines;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final OutlineInputBorder focusedOutlineBorderSide;
  final OutlineInputBorder enabledOutlineBorderSide;
  final double borderRadius;
  CustomTextFormField(
      {this.icon,
      this.hintText,
      this.suffixIcon,
      this.focusNode,
      this.textEditingController,
      this.inputValidator,
      this.contentPadding,
      this.maxLines,
      this.textInputType,
      this.textInputAction,
      this.onFieldSubmitted,
      this.obscureText,
      this.focusedOutlineBorderSide,
      this.enabledOutlineBorderSide,
      this.borderRadius,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.body1,
        focusNode: focusNode,
        controller: textEditingController,
        validator: (value) => inputValidator(value),
        maxLines: maxLines != null ? maxLines : 1,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        onFieldSubmitted: (value) => onFieldSubmitted(value),
        obscureText: obscureText != null ? obscureText : false,
        
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius != null ?  borderRadius : 5)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius != null ?  borderRadius : 5)
          ),
          contentPadding:
              contentPadding != null ? contentPadding : EdgeInsets.zero,
          
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle:
              Theme.of(context).textTheme.body1,
          errorStyle: TextStyle(fontSize: 16),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
