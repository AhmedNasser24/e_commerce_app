import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/trader_repo.dart';

part 'fetch_category_products_for_trader_state.dart';

class FetchCategoryProductsForTraderCubit
    extends Cubit<FetchCategoryProductsForTraderState> {
  FetchCategoryProductsForTraderCubit(this.__traderRepoImpl)
      : super(FetchCategoryProductsForTraderInitial()) {
    fetchCategoryProductsForTrader(category: kAllCategory);
  }

  final TraderRepo __traderRepoImpl;
  String __selectedCategory = kAllCategory;
  bool __isFetchedBefore = false;
  Future<void> fetchCategoryProductsForTrader({String? category}) async {
    !__isFetchedBefore ? emit(FetchCategoryProductsForTraderLoading()) : null;
    __isFetchedBefore = true;
    __selectedCategory = category ?? __selectedCategory;
    Either<List<ProductItemModel>, Failure> response = await __traderRepoImpl
        .fetchCategoryProductsForTrader(category: __selectedCategory);

    response.fold(
      (productItemModelList) {
        emit(FetchCategoryProductsForTraderSuccess(
            productItemModelList: productItemModelList));
      },
      (failure) {
        emit(FetchCategoryProductsForTraderFailure(failure.errMessage));
      },
    );
  }

  Future<void> deleteProduct(
      {required ProductItemModel productItemModel}) async {
    emit(FetchCategoryProductsForTraderLoading());
    Either<void, Failure> result = await __traderRepoImpl.deleteProduct(
        productItemModel: productItemModel);
    result.fold(
      (value) => fetchCategoryProductsForTrader(category: __selectedCategory),
      (fail) => emit(FetchCategoryProductsForTraderFailure(fail.errMessage)),
    );
  }
}
