part of 'cat_list_cubit.dart';

@freezed
class CatListState with _$MovieListState {
  const factory CatListState.initial(
      {List<CateDataModel>? dataList, @Default(false) bool isLoading}) = _Initial;
}
