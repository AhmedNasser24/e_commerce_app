import 'package:e_commerce/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/login_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AccountKindForLogin extends StatefulWidget {
  const AccountKindForLogin({
    super.key,
    required this.loginModel,
  });
  final LoginModel loginModel;
  
  @override
  State<AccountKindForLogin> createState() => _AccountKindForLoginState();
}

class _AccountKindForLoginState extends State<AccountKindForLogin> {
  String selectedAccountKind = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: LocaleKeys.account_kind.tr(),
      onTap: () {
        _showAccountKindDialog(context);
      },
      readOnly: true,
      controller: TextEditingController(text: selectedAccountKind),
      suffixIcon: const Icon(Icons.arrow_drop_down, color: kPurpleColor),
      // suffix: _showPopUpMenu(),
      validator: (_) {
        if (selectedAccountKind.isEmpty) {
          return LocaleKeys.required_field.tr(); 
        }
        widget.loginModel.accountKind = selectedAccountKind;
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
            child: Text(LocaleKeys.account_kind.tr() , style : AppStyle.bold18)),
          
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(LocaleKeys.trader.tr(), style : AppStyle.medium14),
                
                onTap: () {
                  setState(() {
                    selectedAccountKind = LocaleKeys.trader.tr();
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(LocaleKeys.customer.tr(), style : AppStyle.medium14),
                onTap: () {
                  setState(() {
                    selectedAccountKind = LocaleKeys.customer.tr() ;
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
