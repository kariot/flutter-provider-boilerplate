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
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsReponseModelToJson(
        ProductsReponseModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
