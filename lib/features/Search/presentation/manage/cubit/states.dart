import '../../../data/model/product_model.dart';

abstract class SearchStates{}

class InitialAllProductsStates extends  SearchStates{}

class AllProductsSuccessStates extends SearchStates{
  final List<ProductModel> products;

  AllProductsSuccessStates({required this.products});
}

class AllProductsLoadingStates extends SearchStates{}

class AllProductsErrorStates extends SearchStates{
  final String errMessage;

  AllProductsErrorStates({required this.errMessage});
}


class SearchProductsSuccessStates extends SearchStates{
  final List<ProductModel> products;

  SearchProductsSuccessStates({required this.products});
}

class SearchProductsLoadingStates extends SearchStates{}

class SearchProductsErrorStates extends SearchStates{
  final String errMessage;

  SearchProductsErrorStates({required this.errMessage});
}