import 'package:homework_simple_app/src/core/error/failure.dart';
import 'package:homework_simple_app/src/features/shop/domain/category_model.dart';
import 'package:homework_simple_app/src/features/shop/domain/product_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract interface class IShopService {
  Future<Result<List<ProductModel>, Failure>> getProducts(String category);
  Future<Result<List<CategoryModel>, Failure>> getCategories();
}
