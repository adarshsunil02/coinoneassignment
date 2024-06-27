import 'package:assignment/apiservices/api_service.dart';
import 'package:assignment/authentication/auth_provider.dart';
import 'package:assignment/main.dart';
import 'package:assignment/models/models.dart';
import 'package:assignment/screen/subcategory_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthProvider().signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogScreen(),
                ),
                (route) => false,
              );
              if (AuthProvider().errorMessage != null) {
                ScaffoldMessenger.of( context).showSnackBar(
                  SnackBar(
                    content: Text(AuthProvider().errorMessage!),
                    backgroundColor: Colors.black,
                  ),
                );
              }
            },
          )
        ],
      ),

      body: FutureBuilder<List<Category>>(
        future: apiService.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          } else {
            final categories = snapshot.data!;
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final imageUrl =
                    'https://coinoneglobal.in/crm/${category.imgUrlPath}';
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SubCategoryPage(categoryId: category.id,categoryName: category.name,),
                      ),
                    );
                  },

                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            placeholder: (context, url) =>
                             const  Center(child:  CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Text(category.name),
                      ],
                    ),
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
