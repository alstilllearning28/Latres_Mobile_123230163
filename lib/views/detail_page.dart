import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';
import '../controllers/favorite_controller.dart';

class DetailPage extends StatelessWidget {
  final int showId;
  DetailPage({required this.showId});
  
  final detailCtrl = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    detailCtrl.fetchDetail(showId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
            if (Get.isRegistered<FavoriteController>()) {
              Get.find<FavoriteController>().loadFavorites();
            }
          },
        ),
      ),
      body: Obx(() {
        if (detailCtrl.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.amber));
        }
        final show = detailCtrl.showDetail.value;
        if (show == null) return Center(child: Text('Data tidak ditemukan'));

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    show.imageUrl, 
                    fit: BoxFit.contain, 
                    height: 250
                  ),
                ),
                SizedBox(height: 16),
                Text(show.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text(show.rating.toString(), style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 4),
                Text('Genres: ${show.genres.join(', ')}', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 16),
                ElevatedButton.icon( 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: detailCtrl.isFavorite.value ? Colors.grey : Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                  ),
                  onPressed: detailCtrl.toggleFavorite,
                  icon: Icon(detailCtrl.isFavorite.value ? Icons.favorite : Icons.favorite_border, color: Colors.white),
                  label: Text(detailCtrl.isFavorite.value ? 'Hapus Favorit' : 'Favorit', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 16),
                Divider(), 
                SizedBox(height: 8),
                Text('Overview', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(show.summary),
              ],
            ),
          ),
        );
      }),
    );
  }
}