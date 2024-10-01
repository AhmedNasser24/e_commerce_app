part of 'image_picker_cubit.dart';

abstract class ImagePickerState {}

class ImagePickerInitial extends ImagePickerState {}
class ImagePickerLoading extends ImagePickerState {}
class ImagePickerSuccess extends ImagePickerState {
  final String imageUrl;

  ImagePickerSuccess(this.imageUrl);
}
class ImagePickerFailure extends ImagePickerState {
  final String errMessage ;
  ImagePickerFailure(this.errMessage) ;
}
