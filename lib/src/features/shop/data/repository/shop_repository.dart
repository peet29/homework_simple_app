import 'dart:io';

import 'package:dio/dio.dart';
import 'package:homework_simple_app/src/core/error/failure.dart';
import 'package:homework_simple_app/src/features/shop/data/api/shop_api.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/categories_response.dart';
import 'package:homework_simple_app/src/features/shop/data/dto/product_list_response.dart';
import 'package:homework_simple_app/src/features/shop/data/repository/ishop_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_repository.g.dart';

@Riverpod(keepAlive: true)
ShopRepository shopRepository(ShopRepositoryRef ref) {
  return ShopRepository(ref.watch(shopApiProvider));
}

class ShopRepository implements IShopRepository {
  final ShopApi _shopApi;

  ShopRepository(this._shopApi);

  @override
  Future<List<CategoriesResponse>> getCategories() async {
    try {
      return await _shopApi.getCategories();
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }

      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          code: e.response?.statusCode,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
        exception: e,
      );
    }
  }

  @override
  Future<ProductListResponse> getProducts(String category) async {
    try {
      return await _shopApi.getProducts(category);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Failure(message: e.message ?? '');
      }

      if (e.response?.statusCode == 500) {
        throw Failure(
          message: 'Server has some issue, please try again',
          code: e.response?.statusCode,
        );
      }

      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
        exception: e,
      );
    }
  }
}
