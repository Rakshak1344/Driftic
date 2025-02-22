// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectResponse<T> _$ObjectResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ObjectResponse<T>(
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$ObjectResponseToJson<T>(
  ObjectResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };

CollectionResponse<T> _$CollectionResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CollectionResponse<T>(
      (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$CollectionResponseToJson<T>(
  CollectionResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
    };

PagedResponse<T> _$PagedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagedResponse<T>(
      (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      Meta.fromJson(json['meta'] as Map<String, dynamic>),
      Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PagedResponseToJson<T>(
  PagedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'meta': instance.meta,
      'links': instance.links,
    };
