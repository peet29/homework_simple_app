import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/product_response.dart';

part 'product_list_response.freezed.dart';
part 'product_list_response.g.dart';

@freezed
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    required List<ProductResponse> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
