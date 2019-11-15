import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';

class TestQuestionPage extends StatefulWidget {
  @override
  _TestQuestionPageState createState() => _TestQuestionPageState();
}

class _TestQuestionPageState extends State<TestQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试题目"),
      ),
      body: Container(
        color: RdColors.COLOR_THEME_BLUE,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return RdCard.general(
                child: Container(
                  child: RdQuestion.build(question: TestQuestionUtils.testQuestion()[index], index: index),
                  padding: EdgeInsets.all(16),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: Border.all(color: Colors.white60, width: 5),
              );
            },
            itemCount: TestQuestionUtils.testQuestion().length),
      ),
    );
  }
}

class TestQuestionUtils {
  static List<RdQuestionBean> testQuestion() {
    return [
      RdQuestionBean(id: "1", qType: 0, qStatus: 0, title: "选择题测试1", tips: "测试批注", qOptions: [
        RdAnswerBean(id: "1", info: "答案1"),
        RdAnswerBean(id: "2", info: "答案2"),
        RdAnswerBean(id: "3", info: "答案3"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "答案1"),
      ], sAnswers: []),
      RdQuestionBean(id: "1", qType: 0, qStatus: 1, title: "选择题测试2", tips: "测试批注", qOptions: [
        RdAnswerBean(id: "1", info: "答案-------------1"),
        RdAnswerBean(id: "2", info: "答案-------------2"),
        RdAnswerBean(id: "3", info: "答案-------------3"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "答案-------------1"),
      ], sAnswers: [
        RdAnswerBean(id: "3", info: "答案-------------3"),
      ]),
      RdQuestionBean(id: "1", qType: 2, qStatus: 2, title: "判断题测试", tips: "测试批注", qOptions: [
        RdAnswerBean(id: "1", info: "答案1"),
        RdAnswerBean(id: "2", info: "答案2"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "答案1"),
      ], sAnswers: []),
      RdQuestionBean(id: "1", qType: 3, qStatus: 0, title: "排序题", tips: "测试批注", qOptions: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "2", info: "tow"),
      ], sAnswers: []),
      RdQuestionBean(id: "1", qType: 3, qStatus: 2, title: "排序题", tips: "测试批注", qOptions: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "2", info: "tow"),
      ], sAnswers: []),
      RdQuestionBean(id: "1", qType: 3, qStatus: 1, title: "排序题", tips: "测试批注", qOptions: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "2", info: "tow"),
      ], sAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "7", info: "a"),
      ]),
      RdQuestionBean(id: "1", qType: 4, qStatus: 0, title: "连线题", tips: "测试批注", qTitles: [
        RdTitleBean(id: "1", info: "1124"),
        RdTitleBean(id: "2", info: "12"),
        RdTitleBean(id: "3", info: "13"),
        RdTitleBean(id: "4", info: "1123"),
        RdTitleBean(id: "5", info: "11"),
        RdTitleBean(id: "6", info: "1124124"),
        RdTitleBean(id: "7", info: "1124"),
        RdTitleBean(id: "8", info: "11"),
      ], qOptions: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "2", info: "tow"),
      ], sAnswers: []),
      RdQuestionBean(id: "1", qType: 4, qStatus: 1, title: "连线题", tips: "测试批注", qTitles: [
        RdTitleBean(id: "1", info: "1124"),
        RdTitleBean(id: "2", info: "12"),
        RdTitleBean(id: "3", info: "13"),
        RdTitleBean(id: "4", info: "1123"),
        RdTitleBean(id: "5", info: "11"),
        RdTitleBean(id: "6", info: "1124124"),
        RdTitleBean(id: "7", info: "1124"),
        RdTitleBean(id: "8", info: "11"),
      ], qOptions: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "2", info: "tow"),
      ], sAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "7", info: "a"),
      ]),
      RdQuestionBean(id: "1", qType: 4, qStatus: 2, title: "连线题", tips: "测试批注", qTitles: [
        RdTitleBean(id: "1", info: "1124"),
        RdTitleBean(id: "2", info: "12"),
        RdTitleBean(id: "3", info: "13"),
        RdTitleBean(id: "4", info: "1123"),
        RdTitleBean(id: "5", info: "11"),
        RdTitleBean(id: "6", info: "1124124"),
        RdTitleBean(id: "7", info: "1124"),
        RdTitleBean(id: "8", info: "11"),
      ], qOptions: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "2", info: "tow"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
      ], rAnswers: [
        RdAnswerBean(id: "1", info: "one"),
        RdAnswerBean(id: "8", info: "asdklfjl"),
        RdAnswerBean(id: "3", info: "three"),
        RdAnswerBean(id: "5", info: "klsadjf"),
        RdAnswerBean(id: "6", info: "ewar"),
        RdAnswerBean(id: "4", info: "askdjfhjkdsafh"),
        RdAnswerBean(id: "7", info: "a"),
        RdAnswerBean(id: "2", info: "tow"),
      ], sAnswers: []),
    ];
  }
}

class RdAnswerBean extends BaseAnswerBean {
  String id;
  String info;

  RdAnswerBean({this.id, this.info});

  @override
  String answer() {
    return info ?? "";
  }

  @override
  String toString() {
    return 'RdAnswerBean{唯一标识: $id, 答案: $info}';
  }

  @override
  String aid() {
    return id ?? "";
  }
}

class RdTitleBean extends BaseTitleBean {
  String id;
  String info;

  RdTitleBean({this.id, this.info});

  @override
  String aid() {
    return id ?? "";
  }

  @override
  String title() {
    // TODO: implement title
    return info ?? "";
  }
}

class RdQuestionBean extends BaseQuestionBean<RdAnswerBean, RdTitleBean> {
  String id;
  String title;
  String tips;
  int qType;
  int qStatus;
  List<RdAnswerBean> qOptions;
  List<RdAnswerBean> rAnswers;
  List<RdAnswerBean> sAnswers;
  List<RdTitleBean> qTitles;

  RdQuestionBean({this.id, this.title, this.tips, this.qType, this.qStatus, this.qOptions, this.rAnswers, this.sAnswers, this.qTitles});

  @override
  String toString() {
    return 'RdQuestionBean{唯一标示: $id, 题目: $title, 解析: $tips, 类型: $qType, 状态: $qStatus, 选项: $qOptions, 正确答案: $rAnswers, 选择答案: $sAnswers}';
  }

  @override
  String analysis() {
    return tips ?? "";
  }

  @override
  List<RdAnswerBean> answers() {
    if (sAnswers == null) {
      sAnswers = [];
    }
    return sAnswers;
  }

  @override
  List<RdAnswerBean> options() {
    return qOptions ?? [];
  }

  @override
  List<RdAnswerBean> rightAnswers() {
    return rAnswers ?? [];
  }

  @override
  QuestionStatus status() {
    if (qStatus == 1) {
      return QuestionStatus.preview;
    } else if (qStatus == 2) {
      return QuestionStatus.review;
    }
    return QuestionStatus.normal;
  }

  @override
  String topic() {
    return title ?? "";
  }

  @override
  QuestionType type() {
    if (qType == 0) {
      return QuestionType.choice;
    } else if (qType == 1) {
      return QuestionType.multiple_choice;
    } else if (qType == 2) {
      return QuestionType.judge;
    } else if (qType == 3) {
      return QuestionType.sort;
    } else if(qType == 4){
      return QuestionType.connection;
    }
    return null;
  }

  @override
  List<RdTitleBean> titles() {
    return qTitles;
  }
}