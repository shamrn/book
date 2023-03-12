import 'package:flutter/material.dart';
import 'package:good_reader/common/app_constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class FormWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final List<MaskTextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;

  const FormWidget({
    Key? key,
    required this.labelText,
    required this.textController,
    required this.currentFocusNode,
    this.nextFocusNode,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textController,
      focusNode: currentFocusNode,
      inputFormatters: inputFormatters,

      style: TextStyles.montserratMedium
        ..copyWith(fontSize: 16, color: ColorStyles.primaryColor),
      decoration: InputDecoration(
        fillColor: ColorStyles.darkenedBackgroundColor,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyles.montserratMedium
            .copyWith(fontSize: 16, color: ColorStyles.secondColor),
        enabledBorder: _underlineInputBorder,
        focusedBorder: _underlineInputBorder,
      ),

      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          _fieldFocusChange(context, currentFocusNode, nextFocusNode!);
        }
      },
    );
  }

  UnderlineInputBorder get _underlineInputBorder {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
