import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
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
      hintText: S.of(context).account_kind,
      onTap: () {
        _showAccountKindDialog(context);
      },
      readOnly: true,
      controller: TextEditingController(text: selectedAccountKind),
      suffixIcon: const Icon(Icons.arrow_drop_down, color: kPurpleColor),
      // suffix: _showPopUpMenu(),
      validator: (_) {
        if (selectedAccountKind == '') {
          return S.of(context).required_field;
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
            child: Text(S.of(context).account_kind , style : AppStyle.bold18)),
          
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(S.of(context).trader, style : AppStyle.medium14),
                
                onTap: () {
                  setState(() {
                    selectedAccountKind = S.of(context).trader;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).customer, style : AppStyle.medium14),
                onTap: () {
                  setState(() {
                    selectedAccountKind = S.of(context).customer;
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
