import 'package:flutter/material.dart';

class TestApiScreen extends StatelessWidget {
  const TestApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //! AuthCubit ---------------------------------------------------------
          // AuthCubit().loginUser(email: '', password: '');
          // AuthCubit().registerUser(
          //   email: 'email@gmail.com',
          //   password: 'password',
          //   avatar:
          //       'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/434px-Unknown_person.jpg',
          //   name: 'name',
          // );

          //! CategoryCubit -----------------------------------------------------
          // CategoryCubit().getCategories();
          // CategoryCubit().getProductsByCategory(1);
          // CategoryCubit().createCategory(
          //   'categoryName',
          //   'https://cdn.pixabay.com/photo/2021/10/11/23/49/app-6702045_640.png',
          // );
          //* CategoryCubit().updateCategory(11, name: "category");
          // CategoryCubit().deleteCategory(id: 11);

          //! ProductCubit -----------------------------------------------------
          // ProductCubit().getAllProduct();
          //* ProductCubit().filterProduct(priceMax: 900, priceMin: 800);
          //* ProductCubit().createProduct(title: 'title',price: 0,description: 'description',categoryId: 2,);
          //* ProductCubit().updateProduct(id: 62,title: 'title',price: 1000,images: ['https://cdn.pixabay.com/photo/2021/10/11/23/49/app-6702045_640.png']);
          // ProductCubit().deleteProduct(57);
        },
        child: const Icon(Icons.api_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "TestApiScreen",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
