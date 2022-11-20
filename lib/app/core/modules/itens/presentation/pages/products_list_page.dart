import 'package:flutter/material.dart';
import 'package:smartshopfy/components/ds_snack_mixim.dart';

import '../../external/datasources/get_products_datasource_implementation.dart';
import '../../infra/models/models.dart';

class ProductsListPage extends StatefulWidget with DsSnackMixin {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List Page'),
      ),
      body: FutureBuilder<List<ProductModel>?>(
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error on load products'),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    final products = snapshot.data!;
                    return GestureDetector(
                      onTap: (() {
                        widget.starSnack(context);
                      }),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 100,
                                child: Image(
                                  image: NetworkImage(
                                    products[index].imageId,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  subtitle: Text(
                                    products[index].vendor,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  title: Text(
                                    products[index].title,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  trailing: const Icon(Icons.star),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) => const Divider(
                        height: 3,
                        thickness: 2,
                        color: Colors.blue,
                      ),
                  itemCount: snapshot.data!.length);
            }
            return const Text(
                'Error on load products. Please, try again later.');
          }),
          future: _listProducts()),
    );
  }

  Future<List<ProductModel>?> _listProducts() async {
    GetProductsDataSourceImplementation api =
        GetProductsDataSourceImplementation();
    return await api.call();
  }
}
