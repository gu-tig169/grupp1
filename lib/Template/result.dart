class Result {
  String id;
  String category;
  String difficulty;
  int score = 0;

  List<String> resultInfoList = [];

  Result(this.category, this.difficulty);

  static Map<String, dynamic> toJson(Result item) {
    var _score = item.score.toString();
    item.resultInfoList = [item.category, item.difficulty, _score];
    return {"title": item.resultInfoList};
  }
}
