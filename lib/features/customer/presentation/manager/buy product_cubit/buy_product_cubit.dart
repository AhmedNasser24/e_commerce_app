import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/cart_item_model.dart';
import '../../../data/repo/customer_repo_impl.dart';

part 'buy_product_state.dart';

class BuyProductCubit extends Cubit<BuyProductState> {
  BuyProductCubit() : super(BuyProductInitial());
  final CustomerRepo __customerRepoImpl = CustomerRepoImpl();
  bool isLoading = false ;
  Future<void> buyProduct(
      {required List<CartItemModel> cartItemModelList}) async {
    isLoading = true;
    emit(BuyProductLoading());
    Either<void, Failure> result = await __customerRepoImpl.buyProduct(
        cartItemModelList: cartItemModelList);

    result.fold(
      (ok) => emit(BuyProductSuccess(cartItemModelList)),
      (fail) => emit(BuyProductFailure(fail.errMessage)),
    );

    isLoading = false;
  }
}
