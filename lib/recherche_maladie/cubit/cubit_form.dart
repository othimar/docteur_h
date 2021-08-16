import 'package:bloc/bloc.dart';
import 'package:docteur_h/models/search_model.dart';

class FormCubit extends Cubit<SearchModel> {
  FormCubit() : super(SearchModel(keyWord: ""));
  updateForm({
    required String keyWord,
    required bool searchInDeseases,
    required bool searchInSymptoms,
    required bool searchInDrugs,
  }) {
    emit(
      SearchModel(
        keyWord: keyWord, 
        searchInDesease: searchInDeseases,
        searchInSymptom: searchInSymptoms,
        searchInDrug: searchInDrugs));
    print('$state');

  }
}
