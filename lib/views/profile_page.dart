import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final authCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Center(
              child: CircleAvatar(
                radius: 40, 
                backgroundColor: Colors.grey, 
                child: Icon(Icons.person, size: 40, color: Colors.white)
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Obx(() => Text(
                authCtrl.username.value, 
                style: TextStyle(fontSize: 20)
              )),
            ),
            SizedBox(height: 32),
            Text(
              'Kesan & Pesan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Kesan: Mantap sangat GG sampe laptopku matot AOWOWAOOAWK !\nPesan: semoga illmunya bermanfaat, PLIS MASS JAANGAN SAMPEE AKU NGULANG MATKULL  kasih C pun gppp asal gk ngulang dahh',
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(), 
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4) 
                  ),
                ),
                onPressed: authCtrl.logout,
                child: Text('Logout', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}