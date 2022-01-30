import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/dio.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/layout/cubit/states.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
        AppCubit()
          ..getBusiness()
          ..getScience()
          ..getSports()
          ,
        child: BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) => MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: ThemeData(
              //     appBarTheme:AppBarTheme(backgroundColor: Colors.white,)),
              home: Home(),

            )));
  }}
