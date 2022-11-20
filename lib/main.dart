import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smartshopfy/app/core/modules/itens/presentation/pages/products_list_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const SmartShop());
}

class SmartShop extends StatelessWidget {
  const SmartShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
