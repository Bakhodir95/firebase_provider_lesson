class Quiz {
  String id;
  String question;
  List<dynamic> variant;
  int answer;

  Quiz(
      {required this.id,
      required this.question,
      required this.variant,
      required this.answer});
}
