
import 'package:docteur_h/models/maladie_model.dart';

class Maladies {
  static final palu = Maladie()
    ..nom = 'Paludisme'
    ..symptomes = ['mal de tête', 'fièvre', 'fatigue']
    ..medicaments = ['quinine', 'artéméther']
    ..description= "Maladie provoquée par me parasite Plasmodium "+
    "et transmise par une piqûre de moustique infecté."
    ..niveauDanger = 3;

  static final typhoide = Maladie()
    ..nom = 'Typhoïde'
    ..symptomes = ['mal de tête', 'fièvre', 'fatigue', 'diarrhée']
    ..medicaments = ['cypro']
    ..description="Maladie bactérienne qui se transmet par l'ingestion d'eau"+
    " et d'aliments contaminés ou par contact avec une personne infectée"
    ..niveauDanger = 3;
}
