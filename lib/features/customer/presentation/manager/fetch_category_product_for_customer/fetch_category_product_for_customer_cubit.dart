import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../data/repo/customer_repo.dart';
import '../../../data/repo/customer_repo_impl.dart';

part 'fetch_category_product_for_customer_state.dart';

class FetchCategoryProductForCustomerCubit
    extends Cubit<FetchCategoryProductForCustomerState> {
  FetchCategoryProductForCustomerCubit()
      : super(FetchCategoryProductForCustomerInitial());
      
  final CustomerRepo __customerRepoImpl = CustomerRepoImpl();
  String __selectedCategory = kAllCategory;
  Future<void> fetchCategoryProductsForCustomer(
      { String? category}) async {
    emit(FetchCategoryProductForCustomerLoading());
    __selectedCategory = category ?? __selectedCategory;
    Either<List<ProductItemModel>, Failure> result = await __customerRepoImpl
        .fetchCategoryProductsForCustomer(category: __selectedCategory);

    result.fold(
      (productItemModelList) {
        emit(FetchCategoryProductForCustomerSuccess(
            productItemModelList: productItemModelList));
      },
      (fail) {
        emit(FetchCategoryProductForCustomerFailure(fail.errMessage));
      },
    );
  }
}
