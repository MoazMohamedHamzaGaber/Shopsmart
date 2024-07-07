import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../model/product_model.dart';

abstract class GetProductsRepos{
 Stream<Either<Failure,List<ProductModel>>> fetchProducts();
 Future<Either<Failure,List<ProductModel>>> searchProducts(String query);
}