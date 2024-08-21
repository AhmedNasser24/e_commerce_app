import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/data/repo/trader_repo.dart';
import 'package:e_commerce/features/trader/data/repo/trader_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_item_model.dart';

part 'fetch_category_product_for_customer_state.dart';

class FetchCategoryProductForCustomerCubit
    extends Cubit<FetchCategoryProductForCustomerState> {
  FetchCategoryProductForCustomerCubit()
      : super(FetchCategoryProductForCustomerInitial());
      
  final TraderRepo __traderRepoImpl = TraderRepoImpl();
  String __selectedCategory = kAllCategory;
  Future<void> fetchCategoryProductsForCustomer(
      { String? category}) async {
    emit(FetchCategoryProductForCustomerLoading());
    __selectedCategory = category ?? __selectedCategory;
    Either<List<ProductItemModel>, Failure> result = await __traderRepoImpl
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
