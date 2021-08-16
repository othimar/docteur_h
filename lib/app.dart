import 'package:docteur_h/app_cubit.dart';
import 'package:docteur_h/app_state.dart';
import 'package:docteur_h/recherche_maladie/view/page_recherche.dart';
import 'package:docteur_h/recherche_maladie/view/page_resultat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'conseil/view/conseil_page.dart';
import 'recherche_maladie/view/page_detail.dart';

class DoctorApp extends MaterialApp{
  DoctorApp({Key? key}):super(
    key: key, 
    home: BlocProvider(
      create: (_)=>AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state){
          switch (state) {
            case AppState.initial:
              return ConseilPage();
            case AppState.search:
              return PageRecherche();
            case AppState.result:
              return PageResultat();
            case AppState.result_detail:
              return PageDetail();
            default:
              return ConseilPage();
          }
        },
      )),
    title: 'Docteur H',
    debugShowCheckedModeBanner: false,
    theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
    );
}