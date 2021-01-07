class Result {
  String id;
  String category;
  String difficulty;
  int score = 0;

  List<String> resultInfoList = [];

  Result({this.id, this.category, this.difficulty, this.score});

  static Map<String, dynamic> toJson(Result item) {
    var _score = item.score.toString();
    item.resultInfoList = [item.category, item.difficulty, _score];
    return {'title': item.resultInfoList};
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    var list = json['title'].cast<String>();
    String _category = list.elementAt(0);
    String _difficulty = list.elementAt(1);
    int _score = int.parse(list.elementAt(2));
    return Result(
      id: json['id'],
      category: _category,
      difficulty: _difficulty,
      score: _score,
    );
  }
}
