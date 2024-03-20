
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_detail_state.dart';
part 'cat_detail_cubit.freezed.dart';

class CatDetailCubit extends Cubit<CatDetailState> {
  CatDetailCubit() : super(const CatDetailState.initial());
}
