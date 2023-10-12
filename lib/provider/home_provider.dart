import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/infrastructure/home/i_home_repo.dart';
import 'package:provider_template/products_reponse_model/products_reponse_model.dart';
import 'package:provider_template/provider/utils/disposable_provider.dart';

@injectable
class HomeProvider extends DisposableProvider {
  IHomeRepo homeRepo;
  int PAGE_SIZE = 30;

  HomeProvider({required this.homeRepo});

  Future<Either<ApiFailure, ProductsReponseModel>> getProducts(
      int pageKey) async {
    return await homeRepo.getProducts(pageKey, PAGE_SIZE);
  }

  @override
  void disposeValues() {}
}
