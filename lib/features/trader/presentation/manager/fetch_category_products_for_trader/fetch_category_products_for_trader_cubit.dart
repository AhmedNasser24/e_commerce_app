import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/trader_repo.dart';
import '../../../data/repo/trader_repo_impl.dart';

part 'fetch_category_products_for_trader_state.dart';

class FetchCategoryProductsForTraderCubit
    extends Cubit<FetchCategoryProductsForTraderState> {
  FetchCategoryProductsForTraderCubit()
      : super(FetchCategoryProductsForTraderInitial()){
        fetchCategoryProductsForTrader(category: kAllCategory);
      }

  final TraderRepo __traderRepoImpl = TraderRepoImpl();
  String __selectedCategory = kAllCategory ;
  Future<void> fetchCategoryProductsForTrader(
      { String? category}) async {

    emit(FetchCategoryProductsForTraderLoading());
    __selectedCategory = category ?? __selectedCategory ;
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
}
