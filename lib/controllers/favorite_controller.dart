import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteController extends GetxController {
  final box = Hive.box('favorites');
  var favorites = [].obs;

  @override
  void onInit() {
    loadFavorites();
    super.onInit();
  }

  void loadFavorites() {
    favorites.assignAll(box.values.toList());
  }

  void removeFavorite(int id) {
    box.delete(id);
    loadFavorites();
  }
}