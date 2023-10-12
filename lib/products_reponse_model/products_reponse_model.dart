import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'products_reponse_model.g.dart';

@JsonSerializable()
class ProductsReponseModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsReponseModel({this.products, this.total, this.skip, this.limit});

  factory ProductsReponseModel.fromJson(Map<String, dynamic> json) {
    return _$ProductsReponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsReponseModelToJson(this);
}
