import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../data/repo/trader_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.__traderRepoImpl) : super(AddProductInitial());
  final TraderRepo __traderRepoImpl ;
  bool isLoading = false ;
  Future<void> addProduct({required ProductItemModel productItemModel}) async {
    isLoading = true ;
    emit(AddProductLoading());
    Either<void, Failure> result =
        await __traderRepoImpl.addProduct(productItemModel: productItemModel);

    result.fold(
      (success) => emit(AddProductSuccess(productItemModel)),
      (fail) => emit(AddProductFailure(fail.errMessage)),
    );
  }
}
