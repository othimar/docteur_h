import 'package:docteur_h/recherche_maladie/cubit/cubit_form.dart';
import 'package:docteur_h/recherche_maladie/view/view_recherche.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageRecherche extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>FormCubit(),
      child: ViewRecherche(),
      );
  }
}