import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skuy Nonton!'), backgroundColor: Colors.transparent, elevation: 0),
      body: Obx(() {
        if (homeCtrl.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.amber));
        }
        return GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7,
            crossAxisSpacing: 10, mainAxisSpacing: 10,
          ),
          itemCount: homeCtrl.showList.length,
          itemBuilder: (context, index) {
            final show = homeCtrl.showList[index];
            return GestureDetector(
              onTap: () => Get.to(() => DetailPage(showId: show.id)), 
              child: Card(
                color: Colors.grey[900],
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Image.network(show.imageUrl, fit: BoxFit.cover, width: double.infinity)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(show.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              SizedBox(width: 4),
                              
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  show.rating.toString(),
                                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}