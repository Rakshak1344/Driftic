import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.g.dart';

part 'point.freezed.dart';

@freezed
class Point with _$Point {
  const factory Point({
    required int id,
    required int position,
    required DateTime createdAt,
  }) = _Point;

  factory Point.fromJson(Map<String, Object?> json) => _$PointFromJson(json);
}
