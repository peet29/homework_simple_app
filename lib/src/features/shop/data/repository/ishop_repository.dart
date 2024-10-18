import 'package:homework_simple_app/src/features/shop/data/dto/categories_response.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/product_list_response.dart';

abstract class IShopRepository {
  Future<ProductListResponse> getProducts(String category);
  Future<List<CategoriesResponse>> getCategories();
}
