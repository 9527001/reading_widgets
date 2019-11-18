import 'package:flutter/material.dart';
import 'package:jvtd_uikit/jvtd_uikit.dart';
import 'package:reading_widgets/reading_widgets.dart';

enum RdTextFieldType {
  phone,
  password,
}

class RdTextField {
  static Widget login({
    @required String hint,
    @required String label,
    @required RdTextFieldType type,
    EdgeInsets margin = EdgeInsets.zero,
    TextInputType keyboardType = TextInputType.text, //键盘输入类型
    ValueChanged<String> onChanged,
    VoidCallback onEditingComplete,
    FocusNode focusNode,
    Widget suffix,
    TextInputAction textInputAction = TextInputAction.done,
    int maxLength = TextField.noMaxLength,
    bool obscureText = false,
    bool autofocus = false,
  }) {
    assert(type == RdTextFieldType.phone || type == RdTextFieldType.password);
    return Container(
      margin: margin,
      child: unline(
        hint: hint,
        label: label,
        prefix: Padding(
          padding: EdgeInsets.only(left: 4, top: 12, bottom: 16, right: 4),
          child: Container(
            constraints: BoxConstraints.expand(width: 16, height: 16),
            alignment: Alignment.centerLeft,
            child: JvtdImage.local(
              name: type == RdTextFieldType.phone ? RdImages.LOGIN_PHONE : RdImages.LOGIN_PASSWORD,
              package: RdImages.PACKAGE,
              width: 16,
              height: 16,
              fit: BoxFit.contain,
            ),
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        textInputAction: textInputAction,
        maxLength: maxLength,
        obscureText: obscureText,
        autofocus: autofocus,
        contentPadding: EdgeInsets.only(left: 0, right: 10, top: 12, bottom: 12),
        suffix: suffix,
      ),
    );
  }

  static Widget unline({
    @required String hint,
    @required String label,
    Widget prefix,
    Widget suffix,
    TextInputType keyboardType = TextInputType.text, //键盘输入类型
    ValueChanged<String> onChanged,
    VoidCallback onEditingComplete,
    FocusNode focusNode,
    TextInputAction textInputAction = TextInputAction.done,
    int maxLength = TextField.noMaxLength,
    bool obscureText = false,
    bool autofocus = false,
    bool enabled = true,
    Color unlineColor = RdColors.COLOR_DDDDDD,
    Color inputUnlineColor = RdColors.COLOR_THEME_BLUE,
    Color cursorColor = RdColors.COLOR_THEME_BLUE,
    TextStyle labelStyle = const TextStyle(fontSize: 14, color: RdColors.COLOR_000, textBaseline: TextBaseline.alphabetic),
    TextStyle hintStyle = const TextStyle(fontSize: 14, color: RdColors.COLOR_898A95),
    EdgeInsets contentPadding = const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
  }) {
    if (label == null) {
      label = '';
    }
    TextEditingController controller = TextEditingController.fromValue(
      TextEditingValue(
        text: label,
        selection: TextSelection.fromPosition(
          TextPosition(affinity: TextAffinity.downstream, offset: label.length),
        ),
      ),
    );
    UnderlineInputBorder unInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: unlineColor,
        width: 0.5,
      ),
    );
    UnderlineInputBorder inputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: inputUnlineColor,
        width: 0.5,
      ),
    );
    return TextField(
      enabled: enabled,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
      maxLines: 1,
      maxLength: maxLength,
      textInputAction: textInputAction,
      onChanged: onChanged,
      textAlign: TextAlign.left,
      cursorColor: cursorColor,
      cursorWidth: 2,
      style: labelStyle,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: unInputBorder,
        prefixIcon: prefix ?? null,
        suffixIcon: suffix ?? null,
        focusedBorder: inputBorder,
        disabledBorder: unInputBorder,
        enabledBorder: unInputBorder,
        errorBorder: unInputBorder,
        focusedErrorBorder: unInputBorder,
        hintStyle: hintStyle,
        hintText: hint,
        counter: Container(),
        //此属性可去除计数器
        hintMaxLines: 1,
        labelStyle: labelStyle,
      ),
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
    );
  }
}
