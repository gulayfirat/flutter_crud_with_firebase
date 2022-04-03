import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Model {
  Model(
      {this.date,
      this.place,
      this.price,
      this.paymentType,
      this.userId,
      this.id});
  String? id;
  String? date;
  String? place;
  double? price;
  String? paymentType;
  String? userId;

  @override
  static Model fromJson(Map<String, dynamic> json) {
    return _$ModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ModelToJson(this);
  }
}
