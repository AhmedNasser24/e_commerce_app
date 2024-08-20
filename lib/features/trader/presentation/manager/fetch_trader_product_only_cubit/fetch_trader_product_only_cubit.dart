import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/trader_repo.dart';
import '../../../data/repo/trader_repo_impl.dart';

part 'fetch_trader_product_only_state.dart';

class FetchTraderProductOnlyCubit extends Cubit<FetchTraderProductOnlyState> {
  FetchTraderProductOnlyCubit() : super(FetchTraderProductOnlyInitial()) {
    fetchTraderProductOnly();
  }

  final TraderRepo __traderRepoImpl = TraderRepoImpl();
  Future<void> fetchTraderProductOnly() async {
    emit(FetchTraderProductOnlyLoading());
    Either<List<ProductItemModel>, Failure> result =
        await __traderRepoImpl.fetchTraderProductOnly();
    result.fold(
      (productItemModelList) {
        emit(
          FetchTraderProductOnlySuccess(
              productItemModelList: productItemModelList),
        );
        for (var element in productItemModelList) {
          log('${element.tojson()[kProductName]}');
        }
      },
      (fail) => emit(
        FetchTraderProductOnlyFailure(fail.errMessage),
      ),
    );
  }
}
