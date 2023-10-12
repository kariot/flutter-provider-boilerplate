import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/infrastructure/api_constants.dart';
import 'package:provider_template/infrastructure/base/base_repo.dart';
import 'package:provider_template/infrastructure/home/i_home_repo.dart';
import 'package:provider_template/products_reponse_model/products_reponse_model.dart';

@Injectable(as: IHomeRepo)
class HomeRepo extends IHomeRepo with BaseRepo {
  int limit = 30;
  @override
  Future<Either<ApiFailure, ProductsReponseModel>> getProducts(int page) async {
    final url = '${ApiConstants.productsUrl}?skip=${page * limit}&limit=$limit';
    return super.get(
        url,
        (p0) => ProductsReponseModel.fromJson(p0 as Map<String, dynamic>),
        (p0) => 'An error occured');
  }
}
