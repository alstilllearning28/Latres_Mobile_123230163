import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/show_model.dart';
import '../services/api_service.dart';

class DetailController extends GetxController {
  var isLoading = true.obs;
  var showDetail = Rxn<Show>();
  var isFavorite = false.obs;
  final box = Hive.box('favorites');

  void fetchDetail(int id) async {
    try {
      isLoading(true);
      var show = await ApiService.fetchShowDetails(id);
      showDetail.value = show;
      checkFavorite(id);
    } finally {
      isLoading(false);
    }
  }

  void checkFavorite(int id) {
    isFavorite.value = box.containsKey(id);
  }

  void toggleFavorite() {
    if (showDetail.value == null) return;
    
    final show = showDetail.value!;
    if (isFavorite.value) {
      box.delete(show.id);
      isFavorite.value = false;
    } else {
      box.put(show.id, {
        'id': show.id,
        'name': show.name,
        'imageUrl': show.imageUrl,
        'rating': show.rating,
      });
      isFavorite.value = true;
    }
  }
}