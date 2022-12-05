import 'package:flutter/material.dart';
import 'package:flutter_survey/flutter_survey.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  final _formKey = GlobalKey<FormState>();
  final List<Question> _initialData = [Question(isMandatory: true,
    question: "first Question", answerChoices:const  {
      "option 1": null,
      "option 2" : null,
    })];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(key: _formKey,
          child: Survey(
            onNext: (QuestionResult){},
            initialData: _initialData,
          ),)
      ),
    );
  }
}
