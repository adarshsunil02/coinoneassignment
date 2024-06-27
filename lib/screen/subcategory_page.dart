import 'package:assignment/apiservices/api_service.dart';
import 'package:assignment/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SubCategoryPage extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  const SubCategoryPage({super.key, required this.categoryId,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: FutureBuilder<List<SubCategory>>(
        future: apiService.fetchSubCategories(categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No subcategories found'));
          } else {
            final subCategories = snapshot.data!;
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: subCategories.length,
              itemBuilder: (context, index) {
                final subCategory = subCategories[index];
                final imageUrl =
                    'https://coinoneglobal.in/crm/${subCategory.imgUrlPath}';
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Text(subCategory.name),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
