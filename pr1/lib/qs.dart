// ignore_for_file: prefer_final_fields

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Question {

  Image question;
  String answer;
  List<String> choices;

  
  Question({
    required this.question,
    required this.answer,
    required this.choices,
  });
}



class QuestionsList {
  int _currentQuestion = 0;
  List<Question> _questionsBank = [
    Question(
      question:  Image.asset('assets/images/q1.png'),
      answer: 'Albert Einstein',
      choices: [
        'Hitler',
        'Albert Einstein',
        'Nicola Tesla',
        'Charlie Chaplin',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q2.png'),
      answer: 'Ronald Reagan',
      choices: [
        'Donald Trump',
        'Barak Obama',
        'Ronald Reagan',
        'Franklin Roosevelt',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q3.png'),
      answer: 'Christiano Ronaldo',
      choices: [
        'Kylian Mpape',
        'JR.Niymar',
        'Kareem Benzema',
        'Christiano Ronaldo',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q4.png'),
      answer: 'Graham Bell',
      choices: [
        'Charles Darwin',
        'Graham Bell',
        'William Wallace',
        'Isaac Newton',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q5.png'),
      answer: 'Beethoven',
      choices: [
        'Beethoven',
        'Vincent van Gogh',
        'Pablo Picasso',
        'Mozart',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q6.png'),
      answer: 'Bill Gates',
      choices: [
        'Tim Cook',
        'Bill Gates',
        'Steve Jobs',
        'Steve Wozniak',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q7.png'),
      answer: 'Leonel Messi',
      choices: [
        'Gareth Bale',
        'Leonel Messi',
        'Graham Bell',
        'Eden Hazard',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q8.png'),
      answer: 'Thomas Edison',
      choices: [
        'Louis Pasteur',
        'JPMorgan',
        'Robert Koch',
        'Thomas Edison',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q9.png'),
      answer: 'Warren Buffett',
      choices: [
        'Jeff Bezos',
        'Warren Buffett',
        'Bernard Arnault',
        'Charlie Munger',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q10.png'),
      answer: 'Nikola Tesla',
      choices: [
        'Nikola Tesla',
        'Enzo Fratelli',
        'Vittorio Boca',
        'Lucio Antonini',
      ],
    ),
    Question(
      question:  Image.asset('assets/images/q11.png'),
      answer: 'Elon Musk',
      choices: [
        'Griffin Musk',
        'Saxon Musk',
        'Elon Musk',
        'Kai Musk',
      ],
    ),
  ];


  Image getQuestion() => _questionsBank[_currentQuestion].question;
  String getAnswer() => _questionsBank[_currentQuestion].answer;
  String getChoiceOne() => _questionsBank[_currentQuestion].choices[0];
  String getChoiceTwo() => _questionsBank[_currentQuestion].choices[1];
  String getChoiceThree() => _questionsBank[_currentQuestion].choices[2];
  String getChoiceFour() => _questionsBank[_currentQuestion].choices[3];


  bool nextQuestion() {
    if (_currentQuestion < 10) {

      _currentQuestion++;
      return true;
    } else {
      _currentQuestion = 0;
      return false;
    }
  }
  void removTowOption() {
    int counter = 0;
    int myCoun = 0;
    for (counter = 0; counter <= 3; counter++) {
      if (_questionsBank[_currentQuestion].choices[counter] !=
              _questionsBank[_currentQuestion].answer &&
          myCoun <= 1) {
        _questionsBank[_currentQuestion].choices[counter] = '  ';
        myCoun++;
      }
    }
  }
  void replaceQuestion() {
    _currentQuestion++;
  }
}

