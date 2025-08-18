part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class AddOrRemoteFavoriteProduct extends FavoriteState{}
