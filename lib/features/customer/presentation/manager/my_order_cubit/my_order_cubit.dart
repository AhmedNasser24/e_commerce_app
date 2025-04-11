import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/models/my_order_item_model.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';

part 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit(this.__customerRepoImpl) : super(MyOrderInitial()) {
    fetchMyOrderItems();
  }
  final CustomerRepo __customerRepoImpl;
  double totPrice = 0.0;
  bool __isFetchedBefore = false;
  Future<void> fetchMyOrderItems() async {
    !__isFetchedBefore ? emit(MyOrderLoading()) : null;
    __isFetchedBefore = true;

    Either<List<MyOrderItemModel>, Failure> myOrderItemsOrFailure =
        await __customerRepoImpl.fetchMyOrderItems();
    myOrderItemsOrFailure.fold(
      (myOrderItemModelList) {
        totPrice = __getTotalPrice(myOrderItemModelList);
        emit(MyOrderSuccess(myOrderItemModelList: myOrderItemModelList));
      },
      (failure) => emit(MyOrderFailure(failure.errMessage)),
    );
  }

  double __getTotalPrice(List<MyOrderItemModel> myOrderItemModelList) {
    double total = 0.0;
    for (int i = 0; i < myOrderItemModelList.length; i++) {
      total += double.parse(
          myOrderItemModelList[i].cartItemModel.productItemModel.price!);
    }

    return total;
  }
}
