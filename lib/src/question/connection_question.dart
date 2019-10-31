import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class ConnectionQuestion<Q extends BaseQuestionBean> extends StatefulWidget {
  final int index; //题号
  final Q question;

  const ConnectionQuestion({
    Key key,
    @required this.index,
    @required this.question,
  }) : super(key: key); //问题

  @override
  _ConnectionQuestionState createState() {
    TextStyle style = TextStyle(fontSize: 18);
    double titleWidth = 0;
    for (BaseTitleBean title in question.titles()) {
      final textPainter = TextPainter(
        maxLines: 1,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: title.title(), style: style),
      );
      textPainter.layout();
      titleWidth = max(titleWidth, textPainter.width);
    }
    TextStyle aStyle = TextStyle(fontSize: 18);
    double answerWidth = 0;
    for (BaseAnswerBean answer in question.options()) {
      final textPainter = TextPainter(
        maxLines: 1,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: answer.answer(), style: aStyle),
      );
      textPainter.layout();
      answerWidth = max(answerWidth, textPainter.width);
    }
    print(titleWidth.toString() + "," + answerWidth.toString());
    return _ConnectionQuestionState(titleWidth, answerWidth);
  }
}

class _ConnectionQuestionState<Q extends BaseQuestionBean> extends BaseQuestionState<Q, ConnectionQuestion> {
  final double titleWidth;
  final double answerWidth;

  _ConnectionQuestionState(this.titleWidth, this.answerWidth);

  @override
  String index() {
    return widget.index.toString();
  }

  @override
  Q question() {
    return widget.question;
  }

  BaseAnswerBean _movingValue; // 记录正在移动的数据
  List<BaseAnswerBean> _options;
  List<BaseAnswerBean> _answers;

  @override
  void initState() {
    super.initState();
    _options = question().options();
    _answers = _options.map((value) {
      return BaseAnswerBean();
    }).toList();
  }

  @override
  Widget buildQuestion(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildTitlesWidget(),
        Expanded(child: _buildSelectsWidget()),
        _buildOptionsWidget(),
      ],
    );
  }

  Widget _buildOptionsWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildOptions(),
    );
  }

  List<Widget> _buildOptions() {
    return _options.map((value) {
      return _buildOptionWidget(value);
    }).toList();
  }

  Widget _buildOptionWidget(BaseAnswerBean value) {
    return Draggable<BaseAnswerBean>(
      data: value,
      child: _buildOption(value),
      feedback: _buildOption(value, dragging: true),
      childWhenDragging: null,
      onDragStarted: () {
//        print('=== onDragStarted');
        setState(() {
          _movingValue = value; //记录开始拖拽的数据
        });
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
//        print('=== onDraggableCanceled');
        setState(() {
          _movingValue = null; //清空标记进行重绘
        });
      },
      onDragCompleted: () {
//        print('=== onDragCompleted');
      },
    );
  }

  Widget _buildOption(BaseAnswerBean value, {bool dragging = false}) {
    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints.expand(width: answerWidth + 16, height: 40),
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: RdColors.COLOR_F2F2F2, borderRadius: BorderRadius.horizontal(right: Radius.circular(10), left: Radius.circular(dragging ? 0 : 10))),
        child: Text(
          value.answer(),
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  bool _isSelect(BaseAnswerBean value) {
    return _answers.indexWhere((sValue) {
          return value.aid() == sValue.aid();
        }) >=
        0;
  }

  Widget _buildSelectsWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildSelects(),
    );
  }

  List<Widget> _buildSelects() {
    return _answers.map((value) {
      return _buildSelect(value);
    }).toList();
  }

  Widget _buildSelect(BaseAnswerBean value) {
    return DragTarget<BaseAnswerBean>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          constraints: BoxConstraints.expand(height: 40),
          margin: EdgeInsets.only(right: 10,bottom: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: RdColors.COLOR_THEME_ORANGE,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10),
            ),
          ),
          child: Text(value.answer()??"",style: TextStyle(color: Colors.white,fontSize: 18),),
        );
      },
      onAccept: (moveData) {
        print('=== onAccept: $moveData');
        setState(() {
          int toIndex = _answers.indexOf(value);
          _answers.removeAt(toIndex);
          _answers = _answers.map((sValue){
            if(sValue.aid() == moveData.aid()){
              return BaseAnswerBean();
            }
            return sValue;
          }).toList();
          _answers.insert(toIndex,moveData);
        });
      },
    );
  }

  Widget _buildTitlesWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildTitles(),
    );
  }

  List<Widget> _buildTitles() {
    return question().titles().map((value) {
      return _buildTitle(value);
    }).toList();
  }

  Widget _buildTitle(BaseTitleBean value) {
    return Container(
      constraints: BoxConstraints.expand(width: titleWidth + 16, height: 40),
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: RdColors.COLOR_THEME_BLUE, borderRadius: BorderRadius.horizontal(left: Radius.circular(10))),
      child: Text(
        value.title(),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
