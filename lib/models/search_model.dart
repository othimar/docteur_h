class SearchModel{
  bool searchInDesease;
  bool searchInSymptom;
  bool searchInDrug;
  String keyWord;
  SearchModel({
    required this.keyWord,
    this.searchInDesease = true,
    this.searchInSymptom = false,
    this.searchInDrug = false });

    @override
  String toString() {
    return '{keyWord: $keyWord, searchInDesease: $searchInDesease, '+
    'searchInDrug: $searchInDrug, searchInSymptom: $searchInSymptom}';
  }
}