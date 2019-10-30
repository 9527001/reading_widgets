export 'base_question.dart';
export 'choice_question.dart';
export 'sort_question.dart';

import 'package:flutter/cupertino.dart';
import 'package:reading_widgets/reading_widgets.dart';

class RdQuestion {
  /// 创建题目
  /// [index] 题号
  /// [question] 题目
  static Widget build<Q extends BaseQuestionBean>({@required int index, @required Q question}) {
    if (question.type() == QuestionType.choice || question.type() == QuestionType.multiple_choice || question.type() == QuestionType.judge) {
      return ChoiceQuestion<Q>(
        index: index,
        question: question,
        type: question.type(),
      );
    }else if(question.type() == QuestionType.sort){
      return SortQuestion<Q>(
        index: index,
        question: question,
      );
    }
    return Container();
  }
}
