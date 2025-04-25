import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../data/models/register_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AccountKindForRegister extends StatefulWidget {
  const AccountKindForRegister({
    super.key,
    required this.registerModel,
  });
  final UserInfoModel registerModel;

  @override
  State<AccountKindForRegister> createState() => _AccountKindForRegisterState();
}

class _AccountKindForRegisterState extends State<AccountKindForRegister> {
  String selectedAccountKind = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppLocalizations.of(context)!.account_kind,
      onTap: () {
        _showAccountKindDialog(context);
      },
      readOnly: true,
      controller: TextEditingController(text: selectedAccountKind),
      suffixIcon: const Icon(Icons.arrow_drop_down, color: kPurpleColor),
      validator: (_) {
        if (selectedAccountKind == '') {
          return AppLocalizations.of(context)!.required_field;
        }
        widget.registerModel.accountKind = selectedAccountKind;
        return null;
      },
    );
  }

  void _showAccountKindDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(AppLocalizations.of(context)!.account_kind, style: AppStyle.bold18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context)!.trader, style : AppStyle.medium14),
                onTap: () {
                  setState(() {
                    selectedAccountKind = AppLocalizations.of(context)!.trader;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.customer, style : AppStyle.medium14),
                onTap: () {
                  setState(() {
                    selectedAccountKind = AppLocalizations.of(context)!.customer;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
