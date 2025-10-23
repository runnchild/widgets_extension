import 'package:flutter/material.dart';
import 'package:widgets_extension/widgets_extension.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle setColor(Color? color) => copyWith(color: color);

  TextStyle setFontSize(double size) => copyWith(fontSize: size);
}

extension TextExtension on Text {
  Text     _copyWith({
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextScaler? textScaler,
    String? semanticsLabel,
    bool? softWrap,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Locale? locale,
    TextDirection? textDirection,
  }) {
    return Text(
      data ?? '',
      key: key,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaler: textScaler ?? this.textScaler,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }

  TextStyle get _style => style ?? TextStyle();

  Text fontSize(double size) {
    return _copyWith(style: _style.setFontSize(size));
  }

  Text fontColor(Color? color) {
    return _copyWith(style: _style.setColor(color));
  }

  Text fontWeight(FontWeight? fontWeight) {
    return _copyWith(style: _style.copyWith(fontWeight: fontWeight));
  }

  Text bold() {
    return _copyWith(style: _style.bold);
  }

  Text w500() {
    return _copyWith(style: _style.w500);
  }

  Text w600() {
    return _copyWith(style: _style.w600);
  }

  Text italic() {
    return _copyWith(style: _style.italic);
  }

  Text underline() {
    return _copyWith(style: _style.underline);
  }

  Text lineThrough() {
    return _copyWith(style: _style.lineThrough);
  }

  Text ellipsis() {
    return _copyWith(style: _style.copyWith(overflow: TextOverflow.ellipsis));
  }

  Text maxLines_(int maxLines) {
    return _copyWith(maxLines: maxLines);
  }

  Text textAlign_(TextAlign? textAlign) {
    return _copyWith(textAlign: textAlign);
  }

  Text textDirection_(TextDirection? textDirection) {
    return _copyWith(textDirection: textDirection);
  }

  Text locale_(Locale? locale) {
    return _copyWith(locale: locale);
  }

  Text softWrap_(bool? softWrap) {
    return _copyWith(softWrap: softWrap);
  }

  Text overflow_(TextOverflow? overflow) {
    return _copyWith(overflow: overflow);
  }

  Text textScaler_(TextScaler? textScaler) {
    return _copyWith(textScaler: textScaler);
  }

  Text semanticsLabel_(String? semanticsLabel) {
    return _copyWith(semanticsLabel: semanticsLabel);
  }

  Text textWidthBasis_(TextWidthBasis? textWidthBasis) {
    return _copyWith(textWidthBasis: textWidthBasis);
  }

  Text textHeightBehavior_(TextHeightBehavior? textHeightBehavior) {
    return _copyWith(textHeightBehavior: textHeightBehavior);
  }

  Text strutStyle_(StrutStyle? strutStyle) {
    return _copyWith(strutStyle: strutStyle);
  }
}
