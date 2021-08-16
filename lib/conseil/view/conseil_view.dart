import 'package:docteur_h/app_cubit.dart';
import 'package:docteur_h/app_state.dart';
import 'package:docteur_h/conseil/cubit/conseil_cubit.dart';
import 'package:docteur_h/recherche_maladie/view/page_recherche.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../conseil.dart';

class ConseilView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ConseilCubit, Conseil>(
          builder: (context2, conseil) {
            return Text(
              conseil.text,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<AppCubit>().changeState(AppState.search);
        },
        label: Text("Rechercher"),
        icon: Icon(Icons.search),
      ),
    );
  }
}
