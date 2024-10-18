import 'package:homework_simple_app/src/core/error/failure.dart';
import 'package:homework_simple_app/src/features/shop/application/ishop_service.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/categories_response.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/product_list_response.dart';
import 'package:homework_simple_app/src/features/shop/data/repository/shop_repository.dart';
import 'package:homework_simple_app/src/features/shop/domain/category_model.dart';
import 'package:homework_simple_app/src/features/shop/domain/product_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_service.g.dart';

@Riverpod(keepAlive: true)
ShopService shopService(ShopServiceRef ref) {
  return ShopService(ref.read(shopRepositoryProvider));
}

class ShopService implements IShopService {
  final ShopRepository _shopRepository;

  ShopService(this._shopRepository);

  @override
  Future<Result<List<CategoryModel>, Failure>> getCategories() async {
    try {
      final response = await _shopRepository.getCategories();

      final model = response
          .map((e) => CategoryModel(slug: e.slug, name: e.name, url: e.url))
          .toList();

      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<List<ProductModel>, Failure>> getProducts(
      String category) async {
    try {
      final response = await _shopRepository.getProducts(category);

      final model = response.products
          .map((e) => ProductModel(
              id: e.id,
              title: e.title,
              description: e.description,
              category: e.category,
              images: e.images,
              thumbnail: e.thumbnail))
          .toList();

      return Success(model);
    } on Failure catch (e) {
      return Error(e);
    }
  }
}
