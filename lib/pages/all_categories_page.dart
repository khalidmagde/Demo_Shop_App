import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_store_tr/pages/product_page.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget _buildCategoryProduct(String image) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            child: CircleAvatar(
              maxRadius: 48,
              backgroundColor: Colors.transparent,
              child: Image(
                image: AssetImage('images/$image'),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ProductPage();
                  },
                ),
              );
            },
          ),
        ),
        const Text("data"),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Categories",
          style: TextStyle(color: Colors.black),
        ),
        //elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryProduct('applewatch.png'),
                  _buildCategoryProduct('applewatch.png'),
                  _buildCategoryProduct('applewatch.png'),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryProduct('applewatch.png'),
                  _buildCategoryProduct('applewatch.png'),
                  _buildCategoryProduct('applewatch.png'),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryProduct('applewatch.png'),
                  _buildCategoryProduct('applewatch.png'),
                  _buildCategoryProduct('applewatch.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
