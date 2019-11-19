import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';

/// 选择框实体类
///
/// [title] 显示文本
abstract class RdCheckBoxBean {
  String title();
}

/// 样式
///
/// [color] 背景颜色
/// [gradient] 背景颜色
/// [radius] 圆角
/// [borderRadius] 圆角，radius取其一
/// [border] 边框
/// [activeColor] 未选中颜色
/// [checkColor] 选择颜色
/// [checkBgColor] checkbox背景颜色
/// [style] 文字样式
/// [checkStyle] 选中文字样式
/// [fontFamily] 文字样式
class RdCheckBoxStyle {
  final Color color; //背景颜色
  final Gradient gradient; //背景颜色
  final double radius; //圆角
  final BorderRadius borderRadius; //圆角
  final BoxBorder border; //边框
  final Color activeColor; //未选中颜色
  final Color checkColor; //选择颜色
  final Color checkBgColor; //选择背景颜色
  final TextStyle style; //文字样式
  final TextStyle checkStyle; //选中文字样式
  final String fontFamily; //文字样式

  RdCheckBoxStyle({
    this.border,
    this.color = const Color(0xffE4F4FF),
    this.gradient,
    this.fontFamily = RdFonts.AlibabaPuHuiTi,
    this.borderRadius,
    this.radius = 100,
    this.activeColor = RdColors.COLOR_999,
    this.checkColor = RdColors.COLOR_THEME_ORANGE,
    this.checkBgColor = RdColors.COLOR_FFF,
    this.style = const TextStyle(color: RdColors.COLOR_666, fontSize: 20),
    this.checkStyle = const TextStyle(color: RdColors.COLOR_000, fontSize: 20),
  });
}

/// 选择框
///
/// [constraints] 大小
/// [margin] 间距
/// [value] 是否选中
/// [onChanged] 回调方法
/// [data] 数据源
/// [style] 样式
class RdCheckBox<T> extends StatelessWidget {
  final BoxConstraints constraints; //大小
  final EdgeInsets margin; //间距
  final bool value; //是否选中
  final ValueChanged<bool> onChanged; //回调方法
  final T data;
  final RdCheckBoxStyle style;

  const RdCheckBox({
    Key key,
    this.constraints,
    this.margin = EdgeInsets.zero,
    @required this.value,
    @required this.onChanged,
    @required this.data,
    this.style,
  }) : super(key: key);

  RdCheckBoxStyle _style() {
    return style ?? RdCheckBoxStyle();
  }

  @override
  Widget build(BuildContext context) {
    assert(data is String || data is RdCheckBoxBean);
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged(!value);
        }
      },
      child: Container(
        constraints: constraints ?? BoxConstraints.expand(height: 56),
        margin: margin,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: _style().gradient == null ? _style().color : null,
            gradient: _style().gradient,
            borderRadius: _style().borderRadius ?? BorderRadius.circular(_style().radius),
            border: _style().border),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            JvtdRadio(
              value: value,
              activeColor: _style().activeColor,
              checkColor: _style().checkColor,
              color: _style().checkBgColor,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                data is String ? data : (data as RdCheckBoxBean).title(),
                style: value ? RdFonts.family(_style().checkStyle, _style().fontFamily) : RdFonts.family(_style().style, _style().fontFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 选择组
///
/// [datas] 数据组
/// [data] 默认选中
/// [onSelected] 选择回调
/// [multiple] 是否多选
/// [checkBoxStyle] 样式
class RdCheckGroup<T> extends StatefulWidget {
  final List<T> datas; //数据源
  final T data; //默认选中
  final ValueChanged<List<T>> onSelected; //回调方法
  final bool multiple; //是否多选
  final RdCheckBoxStyle checkBoxStyle; //样式

  const RdCheckGroup({
    Key key,
    @required this.datas,
    @required this.onSelected,
    this.multiple = false,
    this.data,
    this.checkBoxStyle,
  }) : super(key: key);

  @override
  _RdCheckGroupState createState() => _RdCheckGroupState<T>();
}

class _RdCheckGroupState<T> extends State<RdCheckGroup> {
  List<T> _selecteds = [];

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      _selecteds.add(widget.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildChildren(),
    );
  }

  List<Widget> _buildChildren() {
    assert(widget.datas.first is String || widget.datas.first is RdCheckBoxBean);
    return widget.datas.map((value) {
      return Container(
        margin: EdgeInsets.only(bottom: 16),
        child: RdCheckBox(
            style: widget.checkBoxStyle,
            value: _selected(value),
            onChanged: (selected) {
              bool select = _selected(value);
              if (widget.multiple) {
                setState(() {
                  if (!select) {
                    _selecteds.add(value);
                  } else {
                    _selecteds.remove(value);
                  }
                });
              } else {
                if (!select) {
                  setState(() {
                    _selecteds.clear();
                    _selecteds.add(value);
                  });
                }
              }
              if (widget.onSelected != null) {
                widget.onSelected(_selecteds);
              }
            },
            data: value),
      );
    }).toList();
  }

  bool _selected(T value) {
    return _selecteds.indexOf(value) != -1;
  }
}
