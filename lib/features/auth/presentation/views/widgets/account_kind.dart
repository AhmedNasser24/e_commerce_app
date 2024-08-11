import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text_form_field.dart';

class AccountKind extends StatefulWidget {
  const AccountKind({
    super.key,
  });

  @override
  State<AccountKind> createState() => _AccountKindState();
}

class _AccountKindState extends State<AccountKind> {
  String selectedAccountKind = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: S.of(context).account_kind,
      onTap: () {
        _showAccountKindDialog(context);
      },
      readOnly: true,
      controller: TextEditingController(text: selectedAccountKind ),
      suffixIcon: const Icon(Icons.arrow_drop_down , color: Colors.white,),
      validator: (_) {
        if (selectedAccountKind == ''){
          return S.of(context).required_field;
        }
        return null;
      },
    );
  }

  void _showAccountKindDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).account_kind),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(S.of(context).trader),
                onTap: () {
                  setState(() {
                    selectedAccountKind = S.of(context).trader;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).customer),
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
