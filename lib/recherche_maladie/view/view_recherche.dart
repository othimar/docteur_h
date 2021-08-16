import 'package:docteur_h/app_state.dart';
import 'package:docteur_h/models/search_model.dart';
import 'package:docteur_h/recherche_maladie/cubit/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docteur_h/app_cubit.dart';

class ViewRecherche extends StatelessWidget {
  final _textController = TextEditingController();
  ViewRecherche({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                context.read<AppCubit>().changeState(AppState.initial),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: BlocBuilder<FormCubit, SearchModel>(
            builder: (localContext, state) => buildForm(localContext, state)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          var searchModel = context.read<FormCubit>().state;
          context.read<FormCubit>().updateForm(
                    keyWord: _textController.text,
                    searchInDeseases: searchModel.searchInDesease,
                    searchInDrugs: searchModel.searchInDrug,
                    searchInSymptoms: searchModel.searchInSymptom);
          context
              .read<AppCubit>()
              .launchSearh(context.read<FormCubit>().state);
        },
      ),
    );
  }

  Widget buildForm(BuildContext context, SearchModel searchModel) {
    _textController.text = searchModel.keyWord;
    Form form = Form(
        child: Column(
      children: [
        TextFormField(
          controller: _textController,
          validator: (text) {
            if (text!.isEmpty) {
              return "Qu'est-ce que vous cherchez?";
            }
          },
          decoration: InputDecoration(
            hintText: "Entrez les mots-clé",
          ),
        ),
        Row(
          children: [
            Text('Maladie'),
            Checkbox(
              value: searchModel.searchInDesease,
              onChanged: (value) {
                context.read<FormCubit>().updateForm(
                    keyWord: _textController.text,
                    searchInDeseases: (value ?? false),
                    searchInDrugs: searchModel.searchInDrug,
                    searchInSymptoms: searchModel.searchInSymptom);
              },
            ),
          ],
        ),

        Row(
          children: [
            Text('Symptôme'),
            Checkbox(
              value: searchModel.searchInSymptom,
              onChanged: (value) {
                context.read<FormCubit>().updateForm(
                    keyWord: _textController.text,
                    searchInDeseases: searchModel.searchInDesease,
                    searchInDrugs: searchModel.searchInDrug,
                    searchInSymptoms: (value ?? false));
              },
            ),
          ],
        ),
        Row(
          children: [
            Text('Médicament'),
            Checkbox(
              value: searchModel.searchInDrug,
              onChanged: (value) {
                context.read<FormCubit>().updateForm(
                    keyWord: _textController.text,
                    searchInDeseases: searchModel.searchInDesease,
                    searchInDrugs: value??false,
                    searchInSymptoms: searchModel.searchInSymptom);
              },
            ),
          ],
        )
      ],
    ));
    return form;
  }
}
