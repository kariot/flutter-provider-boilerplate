import 'package:dartz/dartz.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/products/products_reponse_model/products_reponse_model.dart';

abstract class IHomeRepo {
  Future<Either<ApiFailure, ProductsReponseModel>> getProducts(
      int page, int pageSize);
}
