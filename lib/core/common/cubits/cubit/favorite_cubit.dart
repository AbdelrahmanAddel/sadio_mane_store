import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sadio_mane_store/core/common/model/favorites_model.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final Box<ProductDataModel>? _favoriteBox =
      HiveDatabase._instance.favoritesBox;

  Future<void> addOrRemoteFavoriteProduct({
    required ProductDataModel favorite,
  }) async {
    // remove this
    emit(FavoriteInitial());
    final existIndex = _favoriteBox?.values.toList().indexWhere(
      (product) => product.id == favorite.id,
    ) ?? -1;
    if (existIndex! >= 0) {
      await _favoriteBox?.delete(existIndex);
      emit(AddOrRemoteFavoriteProduct());
      return;
    }
    await _favoriteBox?.add(favorite);
    emit(AddOrRemoteFavoriteProduct());
  }

  bool isFavoriteProduct(String productId) {
    return _favoriteBox!.values.any((product) => product.id == productId);
  }
}

class HiveDatabase {
  factory HiveDatabase() => _instance;

  HiveDatabase._();

  static final HiveDatabase _instance = HiveDatabase._();

  Box<ProductDataModel>? favoritesBox;

  Future<void> setup() async {
    await Hive.initFlutter();

    Hive.registerAdapter(FavoritesModelAdapter());

    favoritesBox = await Hive.openBox<ProductDataModel>('favorites_box');
  }

  Future<void> clearAllBox() async {
    await favoritesBox!.clear();
  }
}
