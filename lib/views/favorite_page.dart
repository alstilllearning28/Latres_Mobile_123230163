import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  final favCtrl = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    favCtrl.loadFavorites(); 
    
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Favorit'), backgroundColor: Colors.transparent, elevation: 0),
      body: Obx(() {
        if (favCtrl.favorites.isEmpty) {
          return Center(child: Text('Belum ada favorit.'));
        }
        return ListView.builder(
          itemCount: favCtrl.favorites.length,
          itemBuilder: (context, index) {
            final item = favCtrl.favorites[index];
            return Card(
              color: Colors.grey[900],
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Image.network(item['imageUrl'], width: 50, fit: BoxFit.cover),
                title: Text(item['name']),
                subtitle: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 4),
                    Text(item['rating'].toString()),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.amber),
                  onPressed: () => favCtrl.removeFavorite(item['id']), 
                ),
                onTap: () => Get.to(() => DetailPage(showId: item['id'])), 
              ),
            );
          },
        );
      }),
    );
  }
}