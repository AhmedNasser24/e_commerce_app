import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/data/repo/trader_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';

part 'fetch_new_orders_state.dart';

class FetchNewOrdersCubit extends Cubit<FetchNewOrdersState> {
  FetchNewOrdersCubit(this.__traderRepo) : super(FetchNewOrdersInitial());
  final TraderRepo __traderRepo;
  List<BuyProductModel> buyProductModelList = [];
  bool isthereNewOrder = false;
  bool isFetchedBefore = false ;
  Future<void> fetchNewOrdersForTrader() async {
    !isFetchedBefore ? emit(FetchNewOrdersLoading()) : null;
    isFetchedBefore = true ;
    Either<List<BuyProductModel>, Failure> result =
        await __traderRepo.fetchNewOrdersforTrader();

    result.fold(
      (buyProductModelList) {
        isthereNewOrder = false ;
        for (var buyProductModel in buyProductModelList) {
          if (buyProductModel.isNew == true){
            isthereNewOrder = true;
            break;
          }
        }
        this.buyProductModelList = buyProductModelList;
        emit(FetchNewOrdersSuccess(buyProductModelList));
      },
      (fail) => emit(FetchNewOrdersFailure(fail.errMessage)),
    );
  }

  Future<void> changeOrderFromNewToOld(
      {required BuyProductModel buyProductModel}) async {
    // ignore: unused_local_variable
    Either<void, Failure> result = await __traderRepo.changeOrderFromNewToOld(
        buyProductModel: buyProductModel);
    await fetchNewOrdersForTrader();
  }

  Future<void> changeOrderFromNotDeliveredToDelivered(
      {required BuyProductModel buyProductModel}) async {
    // ignore: unused_local_variable
    Either<void, Failure> result = await __traderRepo.changeOrderFromNotDeliveredToDelivered(
        buyProductModel: buyProductModel);
    await fetchNewOrdersForTrader();
  }
}
