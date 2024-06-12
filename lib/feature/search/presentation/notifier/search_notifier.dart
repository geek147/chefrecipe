import 'package:chefrecipe/feature/search/domain/usecases/search_usecases.dart';
import 'package:chefrecipe/feature/search/presentation/notifier/search_state.dart';
import 'package:chefrecipe/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier({required this.searchUseCases}) : super(const SearchState());
  final SearchUseCases searchUseCases;

  searchRecipeByImage(String imagePath) async {
    state = state.copyWith(isLoading: true);

    final result = await searchUseCases.searchRecipeByImage(imagePath);
    result.fold((failure) {
      state = state.copyWith(failure: failure, isLoading: false);
    }, (success) {
      //todo: should return success model
      state = state.copyWith(isLoading: false);
    });
  }

  searchRecipeByIngredients(List<String> ingredients) async {
    state = state.copyWith(isLoading: true);

    final result = await searchUseCases.searchRecipeByIngredients(ingredients);
    result.fold((failure) {
      state = state.copyWith(failure: failure, isLoading: false);
    }, (success) {
      //todo: should return success model
      state = state.copyWith(isLoading: false);
    });
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>(
    (ref) => sl<SearchNotifier>());
