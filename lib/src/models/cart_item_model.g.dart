// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      item: ItemModel.fromJson(json['product'] as Map<String, dynamic>),
      id: json['id'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'product': instance.item,
      'id': instance.id,
      'quantity': instance.quantity,
    };
