
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import 'edit_icon_button.dart';

class TraderProductDetails extends StatelessWidget {
  const TraderProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(60),
        const Text(
          "product name",
          style: AppStyle.medium16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Text(
          "product Category",
          style: AppStyle.medium16.copyWith(color: Colors.grey),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        const Row(
          children: [
            Text(
              "55.99 LE",
              style: AppStyle.semiBold16,
            ),
            Spacer(),
            EditIconButton()
          ],
        ),
      ],
    );
  }
}