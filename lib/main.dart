import 'package:bloc_frist_part/bloc/contact_list_cubit.dart';
import 'package:bloc_frist_part/pages/home_page.dart';
import 'package:bloc_frist_part/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactListCubit(),
      child: MaterialApp(
        home: LoginPage(),));
  }
}