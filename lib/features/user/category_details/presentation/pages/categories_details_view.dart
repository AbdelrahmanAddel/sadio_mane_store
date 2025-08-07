import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/networking/dio_factory.dart';
import 'package:sadio_mane_store/features/user/category_details/data/datasources/category_api_service.dart';
import 'package:sadio_mane_store/features/user/category_details/data/datasources/category_remote_data_source.dart';
import 'package:sadio_mane_store/features/user/category_details/data/repositories/category_details_repository_impl.dart';
import 'package:sadio_mane_store/features/user/category_details/domain/usecases/get_category_details_usecase.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                final response = await GetCategoryDetailsUsecase(
                  CategoryDetailsRepositoryImpl(
                    CategoryRemoteDataSource(
                      CategoriesDetailsApiService(Dio()),
                    ),
                  ),
                ).call(10.0);
                response.fold(
                  (error) {
                    print(error);
                  },
                  (success) {
                    print(success);
                  },
                );
              },
              child: Icon(Icons.abc, size: 50, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
