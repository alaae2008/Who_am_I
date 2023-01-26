// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pr1/qs.dart';
import 'package:pr1/butons.dart';
import 'package:pr1/alert.dart';
import 'package:pr1/balance.dart';
import 'package:pr1/lop.dart';
import 'package:pr1/info.dart';




class QuestionsPage extends StatefulWidget {
  static  const id = 'QuestionsPage';

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  QuestionsList questionBank = QuestionsList();
  int currentQuestionNum = 1;
  int currentBalance = 0;
  int loosingBalance = 0;
  bool is5050Used = false;
  bool isSwitchUsed = false;
  String userclickedNumber = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              helpingIconsRow(
                is5050UsedValue: is5050Used,
                isSwitchUsedValue: isSwitchUsed,
                withdrawFunction: () {
                  customAlert(
                    context: context,
                    title: "yarışmadan çekildiniz",
                    desc: "$currentBalance puan kazanadınız",
                    text: "Çıkış",
                    onPressed: () {
                      setState(() {
                        reSetGameData();
                      });
                      Navigator.pushNamed(context, LogoPage.id);
                    },
                  ).show();
                },
                functionOF5050: () {
                  setState(() {
                    if (is5050Used == false) {
                      questionBank.removTowOption();
                      is5050Used = true;
                    }
                  });
                },
                switchFunction: () {
                  setState(() {
                    if (isSwitchUsed == false) {
                      questionBank.replaceQuestion();
                      isSwitchUsed = true;
                    }
                  });
                },
              ),


              gameInfoRow(
                currentBalanceValue: currentBalance,
                currentQustionNumber: currentQuestionNum,
              ),

              presentCurrentQuestion(theQuestion: questionBank.getQuestion()),


              customChoicesButton(
                buttonPadding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                onPressed: () {
                  if (questionBank.getChoiceOne() != '  ') {
                    setState(() {
                      userclickedNumber = '1';
                    });

                    checkAnswe(questionBank.getChoiceOne());
                  }
                },
                text: questionBank.getChoiceOne(),

              ),

              customChoicesButton(
                buttonPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                onPressed: () {
                  if (questionBank.getChoiceTwo() != '  ') {
                    setState(() {
                      userclickedNumber = '2';
                    });

                    checkAnswe(questionBank.getChoiceTwo());
                  }
                },
                text: questionBank.getChoiceTwo(),

              ),

              customChoicesButton(
                buttonPadding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                onPressed: () {
                  if (questionBank.getChoiceThree() != '  ') {
                    setState(() {
                      userclickedNumber = '3';
                    });

                    checkAnswe(questionBank.getChoiceThree());
                  }
                },
                text: questionBank.getChoiceThree(),

              ),

              customChoicesButton(
                buttonPadding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                onPressed: () {
                  if (questionBank.getChoiceFour() != '  ') {
                    setState(() {
                      userclickedNumber = '4';
                    });

                    checkAnswe(questionBank.getChoiceFour());
                  }
                },
                text: questionBank.getChoiceFour(),

              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkAnswe(String userPickedAnswer) async {
    String correctAnswer = questionBank.getAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {

        currentBalance = ListOfBalance().getNewBalance();
      } else {
        loosingBalance = ListOfBalance().isLoss();
      }
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      if (userPickedAnswer != correctAnswer) {
        customAlert(
                context: context,
                onPressed: () {
                  setState(() {
                    reSetGameData();
                  });
                  Navigator.pushNamed(context, LogoPage.id);
                },
                title: 'bool şanslar',
                desc: " $loosingBalance  puan kazandınız",
                text: 'Çıkış')
            .show();
      } else if (currentQuestionNum + 1 > 10) {
        customAlert(
          context: context,
          onPressed: () {
            setState(() {
              reSetGameData();
            });
            Navigator.pushNamed(context, LogoPage.id);
          },
          title: "Tebrikler",
          desc: " $currentBalance puan kazandınız",
          text: "Çıkış",
        ).show();
      } else {
        currentQuestionNum++;
        questionBank.nextQuestion();
      }
    });
  }

  void reSetGameData() {
    currentQuestionNum = 1;
    currentBalance = 0;
    is5050Used = false;
    isSwitchUsed = false;
    ListOfBalance().resetBalanceCounter();
  }
}


Padding customHelpingIcons(
    {required Function() onPressed, required String iconName}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: TextButton(
      onPressed: onPressed,
      child: Image.asset(
        'assets/images/$iconName.png',
        width: 90,
        height: 90,
      ),
    ),
  );
}


Row gameInfoRow({
  required int currentBalanceValue,
  required int currentQustionNumber,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      currentGameInfo(info: '$currentBalanceValue Puan'),
      currentGameInfo(info: '$currentQustionNumber .Soru'),
    ],
  );
}
Row helpingIconsRow({
  required bool isSwitchUsedValue,
  required bool is5050UsedValue,
  required Function() withdrawFunction,
  required Function() functionOF5050,
  required Function() switchFunction,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      customHelpingIcons(
        onPressed: withdrawFunction,
        iconName: 'withdraw',
      ),
      customHelpingIcons(
        onPressed: functionOF5050,
        iconName: is5050UsedValue == false ? '5050' : '5050Used',
      ),
      customHelpingIcons(
        onPressed: switchFunction,
        iconName: isSwitchUsedValue == false ? 'Switch' : 'SwitchUsed',
      ),
    ],
  );
}
Expanded presentCurrentQuestion({required Image theQuestion}) {
  return Expanded(
    flex: 2,
    child: Center(
        child: theQuestion,
        ),
      );


}
