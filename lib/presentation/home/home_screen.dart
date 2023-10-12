import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/presentation/common/common_widget_props.dart';
import 'package:provider_template/products_reponse_model/product.dart';
import 'package:provider_template/products_reponse_model/products_reponse_model.dart';
import 'package:provider_template/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);
  HomeProvider? provider;

  @override
  void initState() {
    provider = Provider.of<HomeProvider>(context, listen: false);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        centerTitle: true,
      ),
      body: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (context, item, index) => ProductListItem(product: item),
        ),
        separatorBuilder: (context, index) => vSpacer20,
      ),
    ));
  }

  Future<void> _fetchPage(int pageKey) async {
    debugPrint('<>fetchPage : $pageKey');
    final result = await provider?.getProducts(pageKey);
    result?.fold(
        (l) => handlePagingError(l), (r) => handlePageResult(r, pageKey));
  }

  handlePagingError(ApiFailure l) {
    _pagingController.error = l.message;
  }

  handlePageResult(ProductsReponseModel r, int pageKey) {
    final isLastPage = pageKey >= (r.total ?? 0);
    if (isLastPage) {
      _pagingController.appendLastPage(r.products ?? []);
    } else {
      final nextPageKey = pageKey + 1;
      debugPrint('<>nextPageKey : $nextPageKey');
      _pagingController.appendPage(r.products ?? [], nextPageKey);
    }
  }
}

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title ?? ''),
      subtitle: Text(product.description ?? ''),
    );
  }
}
