import 'package:flutter/material.dart';
import 'package:reading_widgets/src/config/reading_color.dart';

import '../../reading_widgets.dart';

///睿丁英语弹窗样式
class RdPopUp {
  ///[edgeInsets]弹窗内容间距
  ///[bgOneColors]第一层背景颜色
  ///[bgTwoColors]第二层背景颜色
  ///[bgThreeColors]第三层背景颜色
  ///[bgFourColors]第四层背景颜色
  ///[title]弹窗标题
  ///[titleTop]标题距上的高度
  ///[container]弹窗内容布局
  ///[buttonText]按钮标题
  ///[isShow]是否显示眼睛
  ///[type]显示不同眼睛 0代表全部 1代表只看正确 2代表只看错误
  static Widget popup({
    EdgeInsets edgeInsets = const EdgeInsets.all(0),
    Color bgOneColors = RdColors.COLOR_2470AF,
    Color bgTwoColors = RdColors.COLOR_3CA7FB,
    Color bgThreeColors = RdColors.COLOR_92D1FC,
    Color bgFourColors = RdColors.COLOR_E4F4FE,
    @required String title,
    double titleTop = 15.0,
    @required Container container,
    @required String buttonText,
    @required VoidCallback onPressed,
    bool isShow = true,
    int type = 0,
  }) {
    return AlertDialog(
      ///设置弹窗内容间距为0
      contentPadding: edgeInsets,

      ///设置背景颜色为弹窗蒙层颜色一致
      backgroundColor: Colors.transparent,
      content: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 65),
            decoration: BoxDecoration(
              color: bgOneColors,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(
                  top: titleTop, bottom: 15, left: 10, right: 10),
              decoration: BoxDecoration(
                color: bgTwoColors,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        color: RdColors.COLOR_FFF,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    ///最大高度
                    constraints: BoxConstraints(
                      maxHeight: 300,
                    ),
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: bgThreeColors,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: RdColors.COLOR_FFF,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 10),

                      ///超过最大高度进行上下滚动
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            container,
                            RdButton.general(
                              onPressed: onPressed,
                              isSubscript: true,
                              isShadow: true,
                              shadowColor: RdColors.COLOR_FCE6B4,
                              elevationColor: RdColors.COLOR_THEME_ORANGE,
                              title: buttonText,
                              style: TextStyle(
                                color: RdColors.COLOR_FFF,
                                fontSize: 20,
                              ),
                              constraints: BoxConstraints.expand(height: 50),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 10),
                              color: RdColors.COLOR_THEME_ORANGE,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: isShow
                  ? Container(
                      child: type == 0
                          ? Image.asset(
                              RdImages.RADIO_SELECT,
                              package: RdImages.PACKAGE,
                              width: 100,
                              height: 100,
                            )
                          : (type == 1
                              ? Image.asset(
                                  RdImages.RADIO_UNSELECT,
                                  package: RdImages.PACKAGE,
                                  width: 100,
                                  height: 100,
                                )
                              : Image.asset(
                                  RdImages.RADIO_SELECT,
                                  package: RdImages.PACKAGE,
                                  width: 100,
                                  height: 100,
                                )),
                    )
                  : Container()),
        ],
      ),
    );
  }
}
