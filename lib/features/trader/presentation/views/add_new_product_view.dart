import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/trader/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:e_commerce/features/trader/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/add_new_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/utils/notification_service.dart';
import '../../../../generated/l10n.dart';
import '../../../notifications/data/model/notification_model.dart';
import '../../../notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import '../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'widgets/back_arrow_button.dart';

class AddNewProductView extends StatelessWidget {
  const AddNewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<ImagePickerCubit, ImagePickerState>(
      listener: (context, state) {
        if (state is ImagePickerLoading) {
          isLoading = true;
        } else if (state is ImagePickerSuccess) {
          isLoading = false;
          showSnackBar(context, S.of(context).image_is_added);
        } else if (state is ImagePickerFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlocConsumer<AddProductCubit, AddProductState>(
          listener: (context, state) {
            if (state is AddProductLoading) {
              isLoading = true;
            } else if (state is AddProductSuccess) {
              isLoading = false;
              var notificationModel = NotificationModel(
                title: "E Commerce",
                body: S.of(context).new_product_is_added,
                productItemModel: state.productItemModel,
                token: BlocProvider.of<AuthCubit>(context).notificationToken,
              );
              BlocProvider.of<NotificationCubit>(context)
                  .sendMessageUsingTopic(notificationModel: notificationModel);

              // NotificationService().sendMessageUsingTopic(
              //   notificationModel: NotificationModel(
              //   title: "E Commerce",
              //   body: S.of(context).new_product_is_added,
              //   productItemModel: state.productItemModel,
              // ));
              __showSuccessAwesomeDialog(context);
            } else if (state is AddProductFailure) {
              showSnackBar(context, S.of(context).error_new_product_is_not_added);
              isLoading = false;
            }
          },
          builder: (context, state) {
            
            return Scaffold(
              backgroundColor: kOffWhiteColor,
              body: SafeArea(
                child: AddNewProductBody(isLoading: isLoading),
              ),
              appBar: addNewProductAppBar(context, isLoading),
            );
          },
        );
      },
    );
  }

  AppBar addNewProductAppBar(BuildContext context, bool isLoading) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kPurpleColor,
      leading: BackArrowButton(
        color: kWhiteColor,
        dismissAction: isLoading ? true : false,
      ),
      title: Text(S.of(context).add_product,
          style: AppStyle.medium22.copyWith(color: kWhiteColor)),
      centerTitle: true,
    );
  }

  void __showSuccessAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dismissOnTouchOutside: false,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      desc: S.of(context).product_is_added_successfully,
      btnOkText: S.of(context).ok,
      btnOkOnPress: () {
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .fetchCategoryProductsForTrader();
        Navigator.pop(context);
      },
    ).show();
  }
}
