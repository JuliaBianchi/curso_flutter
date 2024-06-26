import 'package:flutter/material.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/auth_page.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_datail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';

import 'models/order_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProductList(),
          ),
          ChangeNotifierProvider(create: (_) => Cart(),
          ),
          ChangeNotifierProvider(create: (_) => OrderList(),
          ),
          ChangeNotifierProvider(create: (_) => Auth()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            hintColor: Colors.deepOrange,
            fontFamily: 'Lato',

          ),
          //home: const ProductsOverviewPage(),
          routes: {
            AppRoutes.auth: (ctx) => const AuthPage(),
            AppRoutes.home: (ctx) => const ProductsOverviewPage(),
            AppRoutes.product_detail: (ctx) => const ProductDetailPage(),
            AppRoutes.cart: (ctx) => const CartPage(),
            AppRoutes.orders: (ctx) => const OrdersPage(),
            AppRoutes.products: (ctx) => const ProductsPage(),
            AppRoutes.product_form: (ctx) => const ProductFormPage(),

          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
