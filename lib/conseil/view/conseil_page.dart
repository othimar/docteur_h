import 'package:docteur_h/conseil/cubit/conseil_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'conseil_view.dart';

class ConseilPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>ConseilCubit(),
      child: ConseilView(),
      );
  }
}