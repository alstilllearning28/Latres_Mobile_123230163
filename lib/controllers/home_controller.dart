import 'package:get/get.dart';
import '../models/show_model.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var showList = <Show>[].obs;

  @override
  void onInit() {
    fetchShows();
    super.onInit();
  }

  void fetchShows() async {
    try {
      isLoading(true);
      var shows = await ApiService.fetchShows();
      showList.assignAll(shows);
    } finally {
      isLoading(false);
    }
  }
}