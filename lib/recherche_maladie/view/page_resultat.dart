import 'package:docteur_h/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_cubit.dart';

class PageResultat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${context.read<AppCubit>().searchResult.length} résultats'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            context.read<AppCubit>().changeState(AppState.search);
          },
        ),
      ),
      body: ListView(
        children: [
          for (var m in context.read<AppCubit>().searchResult)
            ListTile(
              title: Text(m.nom),
              onTap: (){
                context.read<AppCubit>().showResultDetail(m);
              },
            ),
          
        ],
      ),
    );
  }
}