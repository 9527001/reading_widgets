import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class SortQuestion<Q extends BaseQuestionBean> extends StatefulWidget {
  final int index; //题号
  final Q question;

  const SortQuestion({
    Key key,
    @required this.index,
    @required this.question,
  }) : super(key: key); //问题

  @override
  _SortQuestionState createState() {
    return _SortQuestionState();
  }
}

class _SortQuestionState<Q extends BaseQuestionBean> extends BaseQuestionState<Q, SortQuestion> {
  @override
  String index() {
    return widget.index.toString();
  }

  @override
  Q question() {
    return widget.question;
  }

  BaseAnswerBean _movingValue; // 记录正在移动的数据

  @override
  void initState() {
    super.initState();
    if (question().answers().length <= 0) {
      question().answers().addAll(question().options());
    }
  }

  @override
  Widget buildQuestion(BuildContext context) {
    if (question().status() == QuestionStatus.normal) {
      return _buildNormal();
    } else if (question().status() == QuestionStatus.preview) {
      return _buildPreview();
    }
    return _buildReview();
  }

  Widget _buildPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: _buildAnswers(preview: true),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: _buildRight(),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReview() {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: _buildAnswers(),
    );
  }

  Widget _buildNormal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "拖拽排序",
          style: TextStyle(color: RdColors.COLOR_THEME_ORANGE, fontSize: 16),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: RdColors.COLOR_THEME_ORANGE, width: 1)),
          padding: EdgeInsets.all(8),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: _buildOptions(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildRight() {
    List<Widget> items = List<Widget>();
    question().rightAnswers().forEach((value) {
      items.add(_buildOption(value, preview: false));
    });
    return items;
  }

  List<Widget> _buildAnswers({bool preview = false}) {
    List<Widget> items = List<Widget>();
    question().answers().forEach((value) {
      items.add(_buildOption(value, preview: preview));
    });
    return items;
  }

  List<Widget> _buildOptions() {
    List<Widget> items = List<Widget>();
    question().answers().forEach((value) {
      items.add(_buildDraggable(value));
    });
    return items;
  }

  // 生成可拖动的item
  Widget _buildDraggable(BaseAnswerBean value) {
    return Draggable<BaseAnswerBean>(
      data: value,
      child: DragTarget<BaseAnswerBean>(
        builder: (context, candidateData, rejectedData) {
          return _buildOption(value);
        },
        onWillAccept: (moveData) {
//          print('=== onWillAccept: $moveData ==> $value');
          var accept = moveData != null;
          if (accept) {
            _exchangeItem(moveData, value, false);
          }
          return accept;
        },
        onAccept: (moveData) {
//          print('=== onAccept: $moveData ==> $value');
          _exchangeItem(moveData, value, true);
        },
        onLeave: (moveData) {
//          print('=== onLeave: $moveData ==> $value');
        },
      ),
      feedback: _buildOption(value),
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

  // 基础展示的item 此处设置width,height对GridView 无效，主要是偷懒给feedback用
  Widget _buildOption(BaseAnswerBean value, {bool preview = false}) {
    if (_movingValue != null && value.aid() == _movingValue.aid()) {
      return Container();
    }
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(color: RdColors.COLOR_F2F2F2, borderRadius: BorderRadius.circular(12)),
        child: Text(
          value.answer(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: preview ? _answerColor(value, text: true) : Colors.black),
        ),
      ),
    );
  }

  Color _answerColor(BaseAnswerBean value, {bool text = false}) {
    if (question().status() == QuestionStatus.preview) {
      bool right = _rightOption(value);
      if (right) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else if (!text) {
      return Colors.transparent;
    }
    return RdColors.COLOR_000;
  }

  bool _rightOption(BaseAnswerBean value) {
    var index = question().answers().indexOf(value);
    if (index >= question().rightAnswers().length || index < 0) {
      return false;
    }
    return question().rightAnswers()[index].aid() == value.aid();
  }

  // 重新排序
  void _exchangeItem(moveData, toData, onAccept) {
    setState(() {
      var toIndex = question().answers().indexOf(toData);
      question().answers().remove(moveData);
      question().answers().insert(toIndex, moveData);
      if (onAccept) {
        _movingValue = null;
      }
    });
  }
}
