import 'package:flutter/material.dart';
import 'package:smartshopfy/components/ds_snack_mixim.dart';

import '../../external/datasources/get_products_datasource_implementation.dart';
import '../../infra/models/models.dart';

class TagsListPage extends StatefulWidget with DsSnackMixin {
  const TagsListPage({super.key});

  @override
  State<TagsListPage> createState() => _TagsListPageState();
}

class _TagsListPageState extends State<TagsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tags'),
      ),
      body: FutureBuilder<List<ProductModel>?>(
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error on load tags'),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: ((context, index) {
                    final products = snapshot.data!;
                    return GestureDetector(
                      onTap: (() {}),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                opacity: 0.2,
                                fit: BoxFit.cover,
                                image: NetworkImage(products[index].imageId),
                              ),
                            ),
                            child: ListTile(
                              subtitle: Text(
                                products[index].vendor,
                                style: const TextStyle(color: Colors.black),
                              ),
                              title: Text(
                                products[index].title,
                                style: const TextStyle(color: Colors.black),
                              ),
                              trailing: const Icon(Icons.play_circle_filled),
                            ),
                          )
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
            return const Text('Error on load tags. Please, try again later.');
          }),
          future: _listTags()),
    );
  }

  Future<List<ProductModel>?> _listTags() async {
    GetProductsDataSourceImplementation api =
        GetProductsDataSourceImplementation();
    return await api.call();
  }
}
