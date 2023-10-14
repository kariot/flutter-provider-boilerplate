import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/products/products_reponse_model/products_reponse_model.dart';
import 'package:provider_template/infrastructure/api_constants.dart';
import 'package:provider_template/infrastructure/base/base_repo.dart';
import 'package:provider_template/infrastructure/home/i_home_repo.dart';

@Injectable(as: IHomeRepo)
class HomeRepo extends IHomeRepo with BaseRepo {
  @override
  Future<Either<ApiFailure, ProductsReponseModel>> getProducts(
      int page, int pageSize) async {
    final url =
        '${ApiConstants.productsUrl}?skip=${page * pageSize}&limit=$pageSize';
    return super.get(
        url,
        (p0) => ProductsReponseModel.fromJson(p0 as Map<String, dynamic>),
        (p0) => 'An error occured');
  }
}
