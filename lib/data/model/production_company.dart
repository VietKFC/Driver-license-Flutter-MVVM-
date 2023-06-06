import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable()
class ProductionCompany {
  @JsonKey(name: "logo_path")
  String? path = "";
  @JsonKey(name: "name")
  final String name;

  ProductionCompany(this.path, this.name);

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  toJson() => _$ProductionCompanyToJson(this);
}
