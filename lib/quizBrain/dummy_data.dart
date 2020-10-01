class QuizBrain {

  List scoreKeeper = [];

  static Map<String,String> _questions = {
    'QuestionA':'A',
    'QuestionB':'B',
    'QuestionC':'C',
    'QuestionD':'D',
    'QuestionE':'E',
    'QuestionF':'F',
  };

  List question = _questions.keys.toList();

  List rightAnswers = _questions.values.toList();

  List<List<String>> answers = [
    ['B','J','A','G'],
    ['F','B'],
    ['A','C','F'],
    ['C','F','D','T'],
    ['A','C','F','S','Q','E'],
    ['A','C','F'],
  ];
}