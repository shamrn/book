import 'package:flutter/material.dart';
import 'package:good_reader/widgets/profile/form_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class FormListWidget extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();

  final _phoneMaskTextInputFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
  );

  FormListWidget({Key? key}) : super(key: key) {
    // Mock data
    _firstNameController.value = TextEditingValue(text: 'Владислав');
    _phoneController.value = _phoneMaskTextInputFormatter.formatEditUpdate(
        TextEditingValue(), TextEditingValue(text: '79184220721'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormWidget(
          labelText: 'Имя',
          textController: _firstNameController,
          currentFocusNode: _firstNameFocus,
          nextFocusNode: _lastNameFocus,
        ),
        const SizedBox(
          height: 12,
        ),
        FormWidget(
          labelText: 'Фамилия',
          textController: _lastNameController,
          currentFocusNode: _lastNameFocus,
          nextFocusNode: _emailFocus,
        ),
        const SizedBox(
          height: 12,
        ),
        FormWidget(
          labelText: 'Email',
          textController: _emailController,
          currentFocusNode: _emailFocus,
          nextFocusNode: _phoneFocus,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 12,
        ),
        FormWidget(
          labelText: 'Номер телефона',
          textController: _phoneController,
          currentFocusNode: _phoneFocus,
          keyboardType: TextInputType.phone,
          inputFormatters: [_phoneMaskTextInputFormatter],
        ),
      ],
    );
  }
}
