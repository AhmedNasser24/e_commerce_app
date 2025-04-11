import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../data/repo/trader_repo.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit(this.__traderRepoImpl) : super(EditProductInitial());
  
  final TraderRepo __traderRepoImpl ;

  Future<void> editProduct({required ProductItemModel productItemModel}) async {
    emit(EditProductLoading());
    Either<void, Failure> result =
        await __traderRepoImpl.editProduct(productItemModel: productItemModel);
    result.fold(
      (value) => emit(EditProductSuccess()),
      (fail) => emit(EditProductFailure(fail.errMessage)),
    );
  }
}
