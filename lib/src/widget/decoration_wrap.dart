import 'package:flutter/material.dart';

class DecorationWrap {
  final Widget _child;
  BoxDecoration _decoration = BoxDecoration();

  DecorationWrap({required Widget child}) : _child = child;

  DecorationWrap border(Border border) {
    _decoration = _decoration.copyWith(border: border);
    return this;
  }

  DecorationWrap borderRadius(BorderRadius borderRadius) {
    _decoration = _decoration.copyWith(borderRadius: borderRadius);
    return this;
  }

  DecorationWrap color(Color color) {
    _decoration = _decoration.copyWith(color: color);
    return this;
  }

  DecorationWrap image(DecorationImage image) {
    _decoration = _decoration.copyWith(image: image);
    return this;
  }

  DecorationWrap shape(BoxShape shape) {
    _decoration = _decoration.copyWith(shape: shape);
    return this;
  }

  DecorationWrap backgroundBlendMode(BlendMode backgroundBlendMode) {
    _decoration = _decoration.copyWith(backgroundBlendMode: backgroundBlendMode);
    return this;
  }

  DecorationWrap shadows(List<BoxShadow> shadows) {
    _decoration = _decoration.copyWith(boxShadow: shadows);
    return this;
  }

  DecorationWrap gradient(Gradient gradient) {
    _decoration = _decoration.copyWith(gradient: gradient);
    return this;
  }

  DecorationWrap boxShadow(BoxShadow boxShadow) {
    _decoration = _decoration.copyWith(boxShadow: [boxShadow]);
    return this;
  }

  DecoratedBox build() {
    return DecoratedBox(decoration: _decoration, child: _child);
  }
}
