class AnswerOption {
  String _answer;
  bool _isCorrect;

  AnswerOption(this._answer, this._isCorrect);

  bool get isCorrect => _isCorrect;
  String get answer => _answer;

  set answer(String newAnswer) {
    _answer = newAnswer;
  }
}
