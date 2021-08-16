import 'package:bloc/bloc.dart';
import 'package:docteur_h/app_state.dart';

import 'datas/maladies.dart';
import 'models/maladie_model.dart';
import 'models/search_model.dart';

class AppCubit extends Cubit<AppState> {
  List<Maladie> searchResult = [];
  late Maladie currentDetail;
  SearchModel searchModel = SearchModel(keyWord: '');
  static final allDeseases = [Maladies.palu, Maladies.typhoide];

  AppCubit() : super(AppState.initial);
  changeState(AppState newState) => emit(newState);
  launchSearh(SearchModel sModel) {
    searchModel = sModel;
    //chercher dans la base de données
    searchResult = [];

    if (sModel.keyWord == "") {
      searchResult = allDeseases;
    } else {
      if (sModel.searchInDesease) {
        allDeseases.forEach((dis) {
          if (dis.nom.toLowerCase().contains(sModel.keyWord.toLowerCase())) {
            searchResult.add(dis);
          }
        });
      }
      if (sModel.searchInSymptom) {
        allDeseases.forEach((dis) {
          dis.symptomes.forEach((symptome) {
            if (symptome.toLowerCase().contains(sModel.keyWord.toLowerCase())) {
              searchResult.add(dis);
            }
          });
        });
      }
      if (sModel.searchInDrug) {
        allDeseases.forEach((dis) {
          dis.medicaments.forEach((medoc) {
            if (medoc.toLowerCase().contains(sModel.keyWord.toLowerCase())) {
              searchResult.add(dis);
            }
          });
        });
      }
    }
    searchResult = searchResult.toSet().toList();
    emit(AppState.result);
  }

  showResultDetail(Maladie maladie) {
    currentDetail = maladie;
    emit(AppState.result_detail);
  }
}
