import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:docteur_h/conseil/conseil.dart';

class ConseilCubit extends Cubit<Conseil>{
  Random _random = Random();
  ConseilCubit():super(Conseils.conseilVide){
    conseilAleatoire();
  }

  conseilAleatoire(){
    return emit(Conseils.asList[_random.nextInt(Conseils.asList.length)]);
  }
}