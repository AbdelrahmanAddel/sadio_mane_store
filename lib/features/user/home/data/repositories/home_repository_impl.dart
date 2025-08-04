import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/user/home/data/datasources/home_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';
import 'package:sadio_mane_store/features/user/home/domain/repositories/home_repositry.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.homeRemoteDataSource);

  final HomeRemoteDataSource homeRemoteDataSource;

  @override
  Future<Either<String, List<BannerProductDataModel>>> getBanners() async {
    try {
      final response = await homeRemoteDataSource.getBanners();
      final banners = response.bannerData.banners
          .where((products) => products.title?.contains('/Banner') ?? false)
          .toList();
      if (banners.isEmpty) {
        return const Left('No banners found');
      } else {
        debugPrint('Banners => ${banners[0].title}');

        return Right(banners);
      }
    } on Exception catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, List<CategoriesDataModel>>> getCategories() async {
    try {
      final response = await homeRemoteDataSource.getCategories();
      debugPrint('Categories => ${response.data?.categories?.length}');
      debugPrint('Categories => ${response.data?.categories?[0].name}');
      return Right(response.data?.categories ?? []);
    } on Exception catch (error, stackTrace) {
      debugPrint('Error => $error');
      debugPrint('Stack Trace => $stackTrace');
      return Left(error.toString());
    }
  }
}
