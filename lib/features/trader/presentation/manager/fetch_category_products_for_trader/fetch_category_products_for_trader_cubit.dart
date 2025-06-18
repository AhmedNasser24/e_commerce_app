import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/main.dart';
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
  late List<ProductItemModel> __productItemModelList;
  Future<void> fetchCategoryProductsForTrader({String? category}) async {
    !__isFetchedBefore ? emit(FetchCategoryProductsForTraderLoading()) : null;
    __isFetchedBefore = true;
    __selectedCategory = category ?? __selectedCategory;
    Either<List<ProductItemModel>, Failure> response = await __traderRepoImpl
        .fetchCategoryProductsForTrader(category: __selectedCategory);

    response.fold(
      (productItemModelList) {
        __productItemModelList = productItemModelList;
        emit(FetchCategoryProductsForTraderSuccess(
            productItemModelList: __productItemModelList));
      },
      (failure) {
        emit(FetchCategoryProductsForTraderFailure(failure.errMessage));
      },
    );
  }

  Future<void> deleteProduct(
      {required ProductItemModel productItemModel, required int index}) async {
    emit(FetchCategoryProductsForTraderLoading());
    Either<void, Failure> result = await __traderRepoImpl.deleteProduct(
        productItemModel: productItemModel);
    __productItemModelList.removeAt(index);
    result.fold(
      (value) => emit(
        FetchCategoryProductsForTraderSuccess(
            productItemModelList: __productItemModelList),
      ),
      (fail) {
        showSnackBar(navigatorKey.currentState!.context, fail.errMessage);
        emit(
          FetchCategoryProductsForTraderSuccess(
              productItemModelList: __productItemModelList),
        );
      },
    );
  }
}
