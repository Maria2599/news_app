import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

class Home extends StatelessWidget{
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, States>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              AppCubit cubit = BlocProvider.of(context);
              return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        "News",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    body: cubit.Screens[cubit.Index],
                    bottomNavigationBar: BottomNavigationBar(
                      currentIndex: AppCubit.get(context).Index,
                      onTap: (index) => AppCubit.get(context).changeIndex(index),
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(Icons.business_sharp), label: 'Business'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.sports), label: 'Sports'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.science), label: 'Science'),
                      ],
                    ),
                  );
            });
  }
  
}