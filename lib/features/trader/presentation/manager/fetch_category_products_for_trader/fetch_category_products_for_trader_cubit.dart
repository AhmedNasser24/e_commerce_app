import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/trader_repo.dart';
import '../../../data/repo/trader_repo_impl.dart';

part 'fetch_category_products_for_trader_state.dart';

class FetchCategoryProductsForTraderCubit
    extends Cubit<FetchCategoryProductsForTraderState> {
  FetchCategoryProductsForTraderCubit()
      : super(FetchCategoryProductsForTraderInitial());
  final TraderRepo __traderRepoImpl = TraderRepoImpl();
  Future<void> fetchCategoryProductsForTrader(
      {required String category}) async {
    emit(FetchCategoryProductsForTraderLoading());
    Either<List<ProductItemModel>, Failure> response = await __traderRepoImpl
        .fetchCategoryProductsForTrader(category: category);

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
