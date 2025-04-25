import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

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
    return CustomTextFormField(hintText: AppLocalizations.of(context)!.whatsapp_number,
    keyboardType: TextInputType.phone,
    onChanged: (value) => number = value,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return AppLocalizations.of(context)!.required_field;
        
      }
      if ( value.length != 11) {
        return AppLocalizations.of(context)!.phone_number_must_be_at_least_11_characters;
      }
      widget.registerModel.whatsappNumber = value ;
      return null;
    },
    );
  }
}
