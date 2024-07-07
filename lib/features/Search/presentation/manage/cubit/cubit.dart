import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsmart_users/features/Search/presentation/manage/cubit/states.dart';
import '../../../data/repository/get_products_repos.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(this.getProductsRepos) :super(InitialAllProductsStates());

  final GetProductsRepos getProductsRepos;

  static SearchCubit get(context)=>BlocProvider.of(context);


  void getProducts()async{
    emit(AllProductsLoadingStates());

   await getProductsRepos.fetchProducts().listen((result){
      result.fold((failure){
        emit(AllProductsErrorStates(errMessage: failure.errMessage));
      }, (products) {
        emit(AllProductsSuccessStates(products: products));
      });
    });
  }


  void searchProducts(String query) async {
    emit(SearchProductsLoadingStates());
    final result = await getProductsRepos.searchProducts(query.toLowerCase());
    result.fold(
          (failure) => emit(SearchProductsErrorStates( errMessage:failure.errMessage)),
          (products) => emit(SearchProductsSuccessStates(products: products)),
    );
  }
}