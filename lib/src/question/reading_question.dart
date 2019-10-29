export 'base_question.dart';
export 'choice_question.dart';

import 'package:flutter/cupertino.dart';
import 'package:reading_widgets/reading_widgets.dart';

class RdQuestion {
  static Widget build<Q extends BaseQuestionBean>({int index, @required Q question}) {
    if (question.type() == QuestionType.choice || question.type() == QuestionType.multiple_choice || question.type() == QuestionType.judge) {
      return ChoiceQuestion<Q>(
        index: index,
        question: question,
        type: question.type(),
      );
    }
    return Container();
  }
}
