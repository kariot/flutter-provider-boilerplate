// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsReponseModel _$ProductsReponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductsReponseModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$ProductsReponseModelToJson(
        ProductsReponseModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
