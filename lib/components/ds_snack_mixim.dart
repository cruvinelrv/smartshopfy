import 'package:flutter/material.dart';

mixin DsSnackMixin {
  void starSnack(BuildContext context) {
    var snackBar = const SnackBar(
      content: Text(
          'Componentization is the key to productivity. Vinicius Cruvinel'),
      behavior: SnackBarBehavior.floating,
      elevation: 150,
      width: 300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
