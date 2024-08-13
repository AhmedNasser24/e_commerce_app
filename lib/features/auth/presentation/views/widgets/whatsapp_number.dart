import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/register_model.dart';
import 'custom_text_form_field.dart';

class WhatsAppNumber extends StatefulWidget {
  const WhatsAppNumber({
    super.key, required this.registerModel,
  });
  final RegisterModel registerModel;

  @override
  State<WhatsAppNumber> createState() => _WhatsAppNumberState();
}

class _WhatsAppNumberState extends State<WhatsAppNumber> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(hintText: S.of(context).whatsapp_number,
    keyboardType: TextInputType.phone,
    onChanged: (value) => number = value,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return S.of(context).required_field ;
        
      }
      if ( value.length != 11) {
        return S.of(context).phone_number_must_be_at_least_11_characters;
      }
      widget.registerModel.whatsappNumber = value ;
      return null;
    },
    );
  }
}
