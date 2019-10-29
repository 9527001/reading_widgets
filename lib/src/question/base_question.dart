import 'package:flutter/material.dart';
import 'package:reading_widgets/src/config/reading_color.dart';

enum QuestionType {
  choice, //单选题
  multiple_choice, //多选题
  judge,//判断题
  fill_blank, //填空题
  connection, //连线
  sort, //排序题
}

enum QuestionStatus {
  normal, //正常，可编辑
  preview, //预览，空白试卷
  review, //批阅,有解析状态
}

abstract class BaseQuestionBean<A extends BaseAnswerBean> {
  QuestionType type(); //类型
  QuestionStatus status(); //状态
  String topic(); //题目
  List<A> options(); //答案
  List<A> rightAnswers(); //正确答案集
  List<A> answers(); //选择答案集
  String analysis(); //解析
}

abstract class BaseAnswerBean {
  String aid();//唯一标识
  String answer();//答案
}

abstract class BaseQuestionState<Q extends BaseQuestionBean, T extends StatefulWidget> extends State<T> {
  @protected
  Q question(); //问题
  @protected
  String index(); //问题序号

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTopic(),
        SizedBox(height: spacing()),
        buildQuestionType(context),
        _buildAnalysis(),
      ],
    );
  }

  /// 创建题目
  Widget _buildTopic() {
    return Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            constraints: BoxConstraints.expand(width: 36,height: 36),
            decoration: BoxDecoration(color: Colors.orange,border: Border.all(color: Colors.amberAccent,width: 3),borderRadius: BorderRadius.circular(18)),
            child: Text(
              index(),
              style: TextStyle(color: RdColors.COLOR_FFF, fontSize: 18),
            ),
          ),
          Text(
            question().topic() + _questionType(),
            style: TextStyle(color: RdColors.COLOR_000, fontSize: 18),
          ),
        ],
      );
  }

  //答案间距
  double spacing(){
    return question().status() == QuestionStatus.normal ? 64 : 24;
  }

  String _questionType() {
    if (question().type() == QuestionType.choice) {
      return " (单选)";
    } else if (question().type() == QuestionType.multiple_choice) {
      return " (多选)";
    } else if (question().type() == QuestionType.judge) {
      return " (判断)";
    }
    return "";
  }

  //根据题型创建相关页面
  @protected
  Widget buildQuestionType(BuildContext context);

  /// 创建解析
  Widget _buildAnalysis() {
    return Visibility(
      visible: question().status() == QuestionStatus.preview,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: RdColors.COLOR_THEME_BLUE,borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 14),
            margin: EdgeInsets.only(bottom: 10),
            child: Text("解析",style: TextStyle(color: RdColors.COLOR_FFF,fontSize: 14),),
          ),
          Container(
            child: Text(question().analysis(),style: TextStyle(color: RdColors.COLOR_666,fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
