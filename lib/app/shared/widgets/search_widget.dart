import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/app_colors.dart';
import '../utils/images_utils.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.labelText,
    this.controller,
    this.prefix,
    this.suffix,
    this.contentPadding,
    this.keyboardType,
    this.onChanged,
    this.obscureText,
    this.autofocus,
    this.focusNode,
    this.maxLines,
    this.padding,
    this.validator,
    this.labelStyle,
    this.inputFormatters,
    this.enabled,
    this.hintText,
    this.onEditingComplete,
  });

  final String? labelText;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final bool? obscureText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    Timer? debounce;
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 20,
        shadowColor: black2.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
            enabled: enabled ?? true,
            inputFormatters: inputFormatters,
            validator: validator,
            autofocus: autofocus ?? false,
            focusNode: focusNode,
            maxLines: maxLines ?? 1,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: keyboardType ?? TextInputType.text,
            controller: controller,
            onChanged: (value) {
              if (debounce?.isActive ?? false) debounce?.cancel();
              debounce = Timer(const Duration(milliseconds: 500), () {
                onChanged?.call(value);
              });
            },
            onEditingComplete: onEditingComplete,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: white),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: white),
              ),
              // prefixIcon: prefix,
              // prefixIconConstraints: const BoxConstraints(
              //   maxHeight: 35,
              //   maxWidth: 35,
              // ),
              suffixIcon: Padding(padding: const EdgeInsets.only(right: 20), child: AppImage.svg('ic-search')),
              suffixIconConstraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText ?? 'Cari Barang . . .',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: grey),
            )),
      ),
    );
  }
}


