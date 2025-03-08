import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../data/models/register_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class WhatsAppNumber extends StatefulWidget {
  const WhatsAppNumber({
    super.key, required this.registerModel,
  });
  final UserInfoModel registerModel;

  @override
  State<WhatsAppNumber> createState() => _WhatsAppNumberState();
}

class _WhatsAppNumberState extends State<WhatsAppNumber> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(hintText: LocaleKeys.whatsapp_number.tr(),
    keyboardType: TextInputType.phone,
    onChanged: (value) => number = value,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.required_field.tr() ;
        
      }
      if ( value.length != 11) {
        return LocaleKeys.phone_number_must_be_at_least_11_characters.tr();
      }
      widget.registerModel.whatsappNumber = value ;
      return null;
    },
    );
  }
}
