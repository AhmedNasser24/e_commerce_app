
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class NewOrderItem extends StatelessWidget {
  const NewOrderItem({
    super.key,
    this.onTap,
    this.isNew = false,
  });
  final void Function()? onTap;
  final bool isNew;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: isNew ? Colors.lightGreen : Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Customer Name"),
                const Gap(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${S.of(context).num_of_products} : 3"),
                    isNew ? const Spacer() : const SizedBox(),
                    isNew
                        ? Text(
                            S.of(context).news,
                            style:
                                AppStyle.medium16.copyWith(color: Colors.green),
                          )
                        : const SizedBox()
                  ],
                ),
                const Gap(10),
                Text("${S.of(context).total_price} : 200 ${S.of(context).LE}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
