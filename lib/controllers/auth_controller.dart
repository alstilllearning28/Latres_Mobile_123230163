import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/login_page.dart';
import '../views/main_navigation.dart';

class AuthController extends GetxController {
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? 'User';
  }

  void login(String user, String password) async {
    if (user.isNotEmpty && password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', user);
      username.value = user;
      Get.offAll(() => MainNavigation());
    } else {
      Get.snackbar('Error', 'Isi Username dan password dengan benar');
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAll(() => LoginPage());
  }
}