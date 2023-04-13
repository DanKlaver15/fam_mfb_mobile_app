import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FormattedNumberField extends StatelessWidget {
  const FormattedNumberField({
    Key? key,
    required this.onChange,
    required this.finalValue,
    this.initialValue,
    this.format = '###-###-####',
    this.separator = ' ',
  }) : super(key: key);
  final Function onChange;
  final RxString finalValue;
  final String format;
  final String separator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
      child: TextFormField(
        cursorColor: const Color.fromRGBO(187, 225, 250, 1.0),
        maxLines: 1,
        initialValue: getInitialFormattedNumber(format, initialValue ?? ''),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9$separator]')),
          MaskedTextInputFormatter(
            mask: format,
            separator: separator,
          ),
        ],
        style: const TextStyle(
          color: Color.fromRGBO(187, 225, 250, 1.0),
          fontSize: 14,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.blueGrey,
          ),
          fillColor: Color.fromRGBO(27, 38, 44, 1.0),
          counterText: '',
          filled: true,
          isDense: true,
          hintText: 'phone',
          hintStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 13,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(50, 130, 184, 1.0), width: 2.5),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        onChanged: (value) {
          onChange(value.replaceAll(separator, ''));
          finalValue.value = value;
        },
      ),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;
  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

getInitialFormattedNumber(String format, String str) {
  if (str == '') return '';
  var mask = format;
  str.split('').forEach((item) => {mask = mask.replaceFirst('x', item)});
  return mask.replaceAll('x', '');
}
