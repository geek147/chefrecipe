abstract class SearchDatasource {
  Future<void> searchRecipeByImage(String image);
}

class SearchDatasourceImpl implements SearchDatasource {
  @override
  Future<void> searchRecipeByImage(String image) async {
    return;
  }
}
