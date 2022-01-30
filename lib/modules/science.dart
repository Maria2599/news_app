import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/layout/cubit/states.dart';

class Science extends StatelessWidget{
  const Science({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List Science = AppCubit.get(context).science;
    return BlocConsumer<AppCubit, States>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) =>
            buildComponent(Science));
  }
}