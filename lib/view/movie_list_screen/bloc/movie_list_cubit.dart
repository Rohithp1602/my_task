import 'dart:convert';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import '../../../model/cat_model.dart';

part 'movie_list_state.dart';

part 'movie_list_cubit.freezed.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit() : super(const MovieListState.initial());

  Future<List<DataModel>> getDataFromApi() async {
    emit(state.copyWith(isLoading: true));

    final response = await http
        .get(Uri.parse('https://api.thecatapi.com/v1/breeds?page=1&limit=5'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      emit(state.copyWith(isLoading: false));
      return responseData.map((json) => DataModel.fromJson(json)).toList();
    } else {
      emit(state.copyWith(isLoading: false));
      throw Exception('Failed to load data.');
    }
  }

  void getListData(List<DataModel> dataList) {
    emit(state.copyWith(dataList: dataList));
  }
}
