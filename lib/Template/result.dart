class Result {
  final String id;
  final String category;
  final String difficulty;

  int score = 0;
  int possibleScore = 0;
  List<String> resultInfoList = [];

  Result(
      {this.id,
      this.category,
      this.difficulty,
      this.score,
      this.possibleScore});

//Gör om score till en String &
//lägger in category, difficulty och score i en lista så att den går att spara på api:et.
  static Map<String, dynamic> toJson(Result item) {
    var _score = item.score.toString();
    var _possibleScore = item.possibleScore.toString();
    item.resultInfoList = [
      item.category,
      item.difficulty,
      _score,
      _possibleScore
    ];
    return {'title': item.resultInfoList};
  }

//Mappar om json-Stringen till variablerna i Result.
  factory Result.fromJson(Map<String, dynamic> json) {
    var list = json['title'].cast<String>();
    String _category = list.elementAt(0);
    String _difficulty = list.elementAt(1);
    int _score = int.parse(list.elementAt(2));
    int _possibleScore = int.parse(list.elementAt(3));
    return Result(
        id: json['id'],
        category: _category,
        difficulty: _difficulty,
        score: _score,
        possibleScore: _possibleScore);
  }

  void countPossibleScore(quizLength) {
    int points = 0;
    if (difficulty == 'hard') {
      points = 3;
    }
    if (difficulty == 'medium') {
      points = 2;
    }
    if (difficulty == 'easy') {
      points = 1;
    }
    possibleScore = points * quizLength;
  }
}
