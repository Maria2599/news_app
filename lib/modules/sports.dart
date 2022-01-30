import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/layout/cubit/states.dart';

class Sports extends StatelessWidget{
  const Sports({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List Sports = AppCubit.get(context).sports;
    return BlocConsumer<AppCubit, States>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) =>
            buildComponent(Sports));
  }

}