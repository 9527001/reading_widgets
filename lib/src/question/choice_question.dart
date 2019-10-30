import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jvtd_list/jvtd_list.dart';
import 'package:reading_widgets/reading_widgets.dart';
import 'base_question.dart';

/// 单选题  多选题   判断题
class ChoiceQuestion<Q extends BaseQuestionBean> extends StatefulWidget {
  final int index; //题号
  final Q question; //问题
  final QuestionType type; //类型

  const ChoiceQuestion({
    Key key,
    @required this.index,
    @required this.question,
    this.type = QuestionType.choice,
  }) : super(key: key);

  @override
  _ChoiceQuestionState createState() {
    int rowNum = 2;
    double width = window.physicalSize.width / window.devicePixelRatio;
    TextStyle style = TextStyle(color: RdColors.COLOR_333, fontSize: 18);
    for (BaseAnswerBean answer in question.options()) {
      final textPainter = TextPainter(
        maxLines: 1,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: answer.answer(), style: style),
      );
      textPainter.layout();
      if (textPainter.width > width / 3) {
        rowNum = 1;
        break;
      }
    }
    return _ChoiceQuestionState<Q>(rowNum, style);
  }
}

class _ChoiceQuestionState<Q extends BaseQuestionBean> extends BaseQuestionState<Q, ChoiceQuestion> {
  final int rowNum;
  final TextStyle textStyle;

  _ChoiceQuestionState(this.rowNum, this.textStyle);

  @override
  String index() => widget.index.toString();

  @override
  Q question() => widget.question;

  QuestionType get type => widget.type;

  @override
  Widget buildQuestion(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: rowNum,
      itemBuilder: (BuildContext context, int index) {
        return _buildOption(context, question().options()[index]);
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(1);
      },
      shrinkWrap: true,
      itemCount: question().options().length,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
    );
  }

  Widget _buildOption(BuildContext context, BaseAnswerBean value) {
    return GestureDetector(
      onTap: () {
        if (question().status() == QuestionStatus.normal) {
          _changedSelectOptions(value);
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: rowNum == 1 ? 32 : 0, vertical: 6),
        decoration: BoxDecoration(color: RdColors.COLOR_F2F2F2, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FutureBuilder(
              builder: (context, data) {
                return Image.asset(
                  _selectOption(value) ? RdImages.RADIO_SELECT : RdImages.RADIO_UNSELECT,
                  color: _answerColor(value),
                  width: 24,
                  height: 24,
                  package: RdImages.PACKAGE,
                );
              },
            ),
            SizedBox(width: 5),
            rowNum == 1
                ? Expanded(
                    child: _buildAnswer(value),
                  )
                : _buildAnswer(value),
          ],
        ),
      ),
    );
  }

  /// 创建答案
  Text _buildAnswer(BaseAnswerBean value) {
    return Text(
      value.answer() ?? "",
      style: textStyle.copyWith(color: _answerColor(value,text: true)),
    );
  }

  Color _answerColor(BaseAnswerBean value, {bool text = false}) {
    bool select = _selectOption(value);
    if (question().status() == QuestionStatus.preview) {
      bool right = _rightOption(value);
      if (right) {
        return Colors.green;
      } else if (select && !right) {
        return Colors.red;
      }
    } else if (!text && select) {
      return Colors.orange;
    }
    return text ? RdColors.COLOR_000 : Colors.grey;
  }

  /// 是否选中
  bool _selectOption(BaseAnswerBean value) {
    return question().answers().indexWhere((sValue) {
          return value.aid() == sValue.aid();
        }) >=
        0;
  }

  /// 是否正确答案
  bool _rightOption(BaseAnswerBean value) {
    return question().rightAnswers().indexWhere((rValue) {
          return rValue.aid() == value.aid();
        }) >=
        0;
  }

  //更新选择
  void _changedSelectOptions(BaseAnswerBean value) {
    if (type == QuestionType.choice) {
      question().answers().clear();
      question().answers().add(value);
    } else {
      bool change = _selectOption(value);
      if (!change) {
        question().answers().add(value);
      } else {
        question().answers().removeWhere((sValue) {
          return value.aid() == sValue.aid();
        });
      }
    }
//    if (widget.callback != null) {
//      widget.callback(index, _selectOptions);
//    }
    setState(() {});
  }
}
