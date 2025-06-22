import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/cart_item_model.dart';

part 'buy_product_state.dart';

class BuyProductCubit extends Cubit<BuyProductState> {
  BuyProductCubit(this.__customerRepoImpl) : super(BuyProductInitial());
  final CustomerRepo __customerRepoImpl ;
  bool isLoading = false ;
  Future<void> buyProduct(
      {required List<CartItemModel> cartItemModelList , required bool isPaid , required context}) async {
    isLoading = true;
    emit(BuyProductLoading());
    Either<void, Failure> result = await __customerRepoImpl.buyProduct(
        cartItemModelList: cartItemModelList, isPaid: isPaid);

    result.fold(
      (ok) {
        BlocProvider.of<CartCubit>(context).removeAllProductFromCart(cartItemModelList: cartItemModelList) ;
         emit(BuyProductSuccess(cartItemModelList));},
      (fail) => emit(BuyProductFailure(fail.errMessage)),
    );

    isLoading = false;
  }
}
