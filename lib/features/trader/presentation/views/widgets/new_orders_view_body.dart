import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class NewOrdersViewBody extends StatelessWidget {
  const NewOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      title: const Text("Customer Name"),
      subtitle: Text("${S.of(context).num_of_products} : 3"),
      trailing: Text("${S.of(context).total_price} : 1000 ${S.of(context).LE}"),
      
    );
  }
}