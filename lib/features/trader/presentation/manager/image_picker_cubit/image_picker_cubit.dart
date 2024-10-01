import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/trader/data/repo/trader_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/repo/trader_repo_impl.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
  final TraderRepo __traderRepoImpl = TraderRepoImpl();
  String currImageUrl = "";
  Future<void> imagePickerFromCamera() async {
    emit(ImagePickerLoading());
    Either<String, Failure> result =
        await __traderRepoImpl.imagePickerFromCamera();

    result.fold(
      (imageUrl) => emit(ImagePickerSuccess(imageUrl)),
      (fail) => emit(ImagePickerFailure(fail.errMessage)),
    );
  }

  Future<void> imagePickerFromGallery() async {
    emit(ImagePickerLoading());
    Either<String, Failure> result =
        await __traderRepoImpl.imagePickerFromGallery();

    result.fold(
      (imageUrl) => emit(ImagePickerSuccess(imageUrl)),
      (fail) => emit(ImagePickerFailure(fail.errMessage)),
    );
  }
  
  void setInitImageUrl(String imageUrl) {
    currImageUrl = imageUrl;
  }
}
