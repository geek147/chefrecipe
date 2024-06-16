import 'package:chefrecipe/core/failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    String? resultImage,
    String? resultIngredients,
    Failure? failure,
  }) = _SearchState;

  const SearchState._();
}
