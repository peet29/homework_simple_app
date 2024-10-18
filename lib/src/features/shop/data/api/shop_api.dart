import 'package:dio/dio.dart';
import 'package:homework_simple_app/src/core/network/network_service.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/categories_response.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/product_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_api.g.dart';

@Riverpod(keepAlive: true)
ShopApi shopApi(ShopApiRef ref) {
  final dio = ref.watch(networkServiceProvider);
  return ShopApi(dio);
}

@RestApi()
abstract interface class ShopApi {
  factory ShopApi(Dio dio) => _ShopApi(dio);

  @GET('products/category/{category}')
  Future<ProductListResponse> getProducts(
    @Path('category') String category,
  );

  @GET('products/categories')
  Future<List<CategoriesResponse>> getCategories();
}
