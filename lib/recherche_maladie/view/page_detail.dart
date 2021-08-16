import 'package:docteur_h/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:docteur_h/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(context.read<AppCubit>().currentDetail.nom),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  context.read<AppCubit>().changeState(AppState.result);
                },
                icon: Icon(Icons.arrow_back))),
        body: WillPopScope(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    context.read<AppCubit>().currentDetail.nom,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  WidgetDanger(
                      context.read<AppCubit>().currentDetail.niveauDanger),
                ],
              ),
              Text(
                context.read<AppCubit>().currentDetail.description,
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  Text("Symptômes",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              for (var s in context.read<AppCubit>().currentDetail.symptomes)
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.green,
                    ),
                    Text(s, style: TextStyle(fontSize: 18))
                  ],
                ),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  Text("Traitements",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
              for (var med
                  in context.read<AppCubit>().currentDetail.medicaments)
                Text(med, style: TextStyle(fontSize: 18))
            ],
          ),
          onWillPop: () {
            return Future(() {
              print("Je rentre");
              return true;
            });
          },
        ));
  }
}

class WidgetDanger extends StatelessWidget {
  final int level;
  WidgetDanger(this.level);
  @override
  Widget build(BuildContext context) {
    Color c;
    switch (level) {
      case 1:
        c = Colors.green.shade300;
        break;
      case 2:
        c = Colors.orange.shade300;
        break;
      case 3:
        c = Colors.red.shade300;
        break;
      default:
        c = Colors.grey;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 10,
          width: 10,
          //color: c,
          margin: EdgeInsets.only(left: 10, right: 2, bottom: 5),
          decoration:
              BoxDecoration(color: c, boxShadow: [BoxShadow(blurRadius: 5)]),
        ),
        if (level > 1)
          Container(
            height: 20,
            width: 10,
            margin: EdgeInsets.only(right: 2, bottom: 5),
            decoration:
                BoxDecoration(color: c, boxShadow: [BoxShadow(blurRadius: 5)]),
          ),
        if (level > 2)
          Container(
            height: 30,
            width: 10,
            margin: EdgeInsets.only(right: 2, bottom: 5),
            decoration:
                BoxDecoration(color: c, boxShadow: [BoxShadow(blurRadius: 5)]),
          ),
      ],
    );
  }
}
