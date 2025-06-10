import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/screen/cart_screen.dartcart_screen.dart';
import 'package:store/screen/home_screen.dart';

import 'cubit/cart_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // علشان العرض يبقى من اليمين لليسار
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (_) => CartCubit(),
        child: MaterialApp(
          routes: {'/cart': (_) => CartScreen()},
          debugShowCheckedModeBanner: false,
          title: 'متجر الكتروني',
          theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Cairo'),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
