import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';


class TitleText extends StatelessWidget {
  const TitleText({
    super.key, required this.title,
  });
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Text(title , style: AppStyle.semiBold28,
    
    
    );
  }
}
