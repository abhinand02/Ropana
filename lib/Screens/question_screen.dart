import 'package:flutter/material.dart';

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question(
      {required this.text,
      required this.options,
      this.isLocked = false,
      this.selectedOption});
}

class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});
}

final questions = [
  Question(
    text: "Question one",
    options: [
      Option(text: 'option 1', isCorrect: false),
      Option(text: 'option 2', isCorrect: false),
      Option(text: 'option 3', isCorrect: false),
      Option(text: 'option 4', isCorrect: false),
    ],
  ),
  Question(
    text: "Question two",
    options: [
      Option(text: 'option 1', isCorrect: false),
      Option(text: 'option 2', isCorrect: false),
      Option(text: 'option 3', isCorrect: false),
      Option(text: 'option 4', isCorrect: false),
    ],
  ),
  Question(
    text: "Question three",
    options: [
      Option(text: 'option 1', isCorrect: false),
      Option(text: 'option 2', isCorrect: false),
      Option(text: 'option 3', isCorrect: false),
      Option(text: 'option 4', isCorrect: false),
    ],
  ),
  Question(
    text: "Question four",
    options: [
      Option(text: 'option 1', isCorrect: false),
      Option(text: 'option 2', isCorrect: false),
      Option(text: 'option 3', isCorrect: false),
      Option(text: 'option 4', isCorrect: false),
    ],
  )
];

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuestionWidget(),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _questionNumber = 1;
  late PageController _controller;
   double _score = 1;

  @override
  void initState() {
    super.initState();
    _controller =PageController(initialPage: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Text('Question $_questionNumber/${questions.length}'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final _question = questions[index];
                return buidQuestion(_question);
              },
            ),
          ),
          Slider(value: _score, min: 0,max: 50,
          onChanged: (value){}),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text('Skip')),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Text('Continue')),
              ],
            ),
buildElevetedButton(),
          ],),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column buidQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: const TextStyle(fontSize: 25),
        ),
        Expanded(
            child: OptionsWidget(
          question: question,
          onClickedOption: (Option value) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = value;
              });
            }
          },
        ))
      ],
    );
  }

  ElevatedButton buildElevetedButton() {
    return ElevatedButton(
        onPressed: () {
if(_questionNumber < questions.length){
_controller.nextPage(duration:const  Duration(milliseconds: 300), curve: Curves.ease);
setState(() {
  _questionNumber++;
  _score+=10;
});
}
        },
        child: Text(_questionNumber < questions.length ? 'Next' : 'Finish'),);
  }
}

class OptionsWidget extends StatelessWidget {
  Question question;
  final ValueChanged<Option> onClickedOption;

  OptionsWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options
          .map((option) => buildOption(context, option))
          .toList(),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey;
  }
}
