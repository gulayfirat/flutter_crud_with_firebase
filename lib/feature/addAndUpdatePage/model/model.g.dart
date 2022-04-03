// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      date: json['date'] as String?,
      place: json['place'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      paymentType: json['paymentType'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'place': instance.place,
      'price': instance.price,
      'paymentType': instance.paymentType,
      'userId': instance.userId,
    };
