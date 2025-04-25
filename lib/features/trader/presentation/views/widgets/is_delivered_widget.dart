import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';

class IsDeliveredWidget extends StatefulWidget {
  const IsDeliveredWidget({super.key, required this.buyProductModel});
  final BuyProductModel buyProductModel;
  @override
  State<IsDeliveredWidget> createState() => _IsDeliveredWidgetState();
}

class _IsDeliveredWidgetState extends State<IsDeliveredWidget> {
  late bool isDelivered;
  late String customerName;
  @override
  void initState() {
    isDelivered = widget.buyProductModel.isDelivered;
    customerName = widget.buyProductModel.userInfoModel.name!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isDelivered
        ? CustomButton(
            title: AppLocalizations.of(context)!.delivered,
            style: AppStyle.medium14,
            backGroundColor: kWhiteColor,
            horizontalPadding: 6,
            verticalPadding: 0,
            onTap: () {},
          )
        : CustomButton(
            title: AppLocalizations.of(context)!.is_it_delivered,
            style: AppStyle.medium14,
            backGroundColor: kWhiteColor,
            horizontalPadding: 6,
            verticalPadding: 0,
            onTap: () {
              _showCheckDialog(context);
            },
          );
  }

  void _showCheckDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "${AppLocalizations.of(context)!.did_you_sent_orders_to}\n$customerName",
              style: AppStyle.semiBold18,
              textAlign: TextAlign.center,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                color: Colors.red,
              ),
              const Gap(10),
              ListTile(
                title: Text(AppLocalizations.of(context)!.yes, style: AppStyle.medium14),
                onTap: () {
                  widget.buyProductModel.isDelivered = true;
                  isDelivered = true;
                  setState(() {});
                  //---------------------------------------------------------------------------
                  //this feature is also remove my orders items for customer
                  BlocProvider.of<FetchNewOrdersCubit>(context)
                      .changeOrderFromNotDeliveredToDelivered(
                          buyProductModel: widget.buyProductModel);
                  //---------------------------------------------------------------------------
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.not_yet, style: AppStyle.medium14),
                onTap: () {
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
