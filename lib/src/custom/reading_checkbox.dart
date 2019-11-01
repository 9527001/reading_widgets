import 'package:flutter/material.dart';
import 'package:reading_widgets/reading_widgets.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';

abstract class RdCheckBoxBean {
  String title();
}

class RdCheckBox<T> extends StatelessWidget {
  final BoxConstraints constraints; //大小
  final EdgeInsets margin; //间距
  final Color color; //背景颜色
  final Gradient gradient; //背景颜色
  final double radius; //圆角
  final BorderRadius borderRadius; //圆角
  final BoxBorder border; //边框
  final bool value; //是否选中
  final ValueChanged<bool> onChanged; //回调方法
  final T data;

  const RdCheckBox({
    Key key,
    this.constraints,
    this.gradient,
    this.borderRadius,
    this.border,
    this.margin = EdgeInsets.zero,
    this.color = const Color(0xffE4F4FF),
    this.radius = 100,
    @required this.value,
    @required this.onChanged,
    @required this.data,
  }) : super(key: key);

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
        decoration: BoxDecoration(color: gradient == null ? color : null, gradient: gradient, borderRadius: borderRadius ?? BorderRadius.circular(radius), border: border),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            JvtdRadio(
              value: value,
              activeColor: RdColors.COLOR_999,
              checkColor: RdColors.COLOR_THEME_ORANGE,
              color: RdColors.COLOR_FFF,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                data is String ? data : (data as RdCheckBoxBean).title(),
                style: TextStyle(color: value ? RdColors.COLOR_000 : RdColors.COLOR_666, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RdCheckGroup<T> extends StatefulWidget {
  final List<T> datas; //数据源
  final T data; //默认选中
  final ValueChanged<List<T>> onSelected; //回调方法
  final bool multiple; //是否多选

  const RdCheckGroup({
    Key key,
    @required this.datas,
    @required this.onSelected,
    this.multiple = false,
    this.data,
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
