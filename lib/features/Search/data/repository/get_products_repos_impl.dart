import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/const.dart';
import '../model/product_model.dart';
import 'get_products_repos.dart';

class GetProductsReposImpl implements GetProductsRepos {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  @override
  Stream<Either<Failure, List<ProductModel>>> fetchProducts() {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((snapshot) {
      try {
        List<ProductModel> products = snapshot.docs
            .map((doc) =>
                ProductModel.fromJson(doc.data() as Map<String, dynamic>))
            .toList();
        return Right(products);
      } catch (e) {
        return Left(FirebaseFailure(e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, List<ProductModel>>> searchProducts(
      String query) async {
    try {
      final normalizedQuery = capitalize(query);

      QuerySnapshot querySnapshot = await productsCollection
          .where('productTitle', isGreaterThanOrEqualTo: normalizedQuery)
          .where('productTitle',
              isLessThanOrEqualTo: normalizedQuery + '\uf8ff')
          .get();

      List<ProductModel> products = querySnapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return Right(products);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
