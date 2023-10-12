import 'package:dartz/dartz.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/products_reponse_model/products_reponse_model.dart';

abstract class IHomeRepo {
  Future<Either<ApiFailure, ProductsReponseModel>> getProducts(int page);
}
