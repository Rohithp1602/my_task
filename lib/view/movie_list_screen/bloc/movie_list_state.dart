part of 'movie_list_cubit.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial(
      {List<DataModel>? dataList, @Default(false) bool isLoading}) = _Initial;
}
