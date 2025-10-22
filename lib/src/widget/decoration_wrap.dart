import 'package:flutter/material.dart';

class DecorationWrap {
  final BoxDecoration _decoration;
  final Widget _child;

  const DecorationWrap(
      {required BoxDecoration decoration, required Widget child})
      : _child = child,
        _decoration = decoration;

  DecorationWrap border(Border border) {
    _decoration.copyWith(border: border);
    return this;
  }

  DecorationWrap borderRadius(BorderRadius borderRadius) {
    _decoration.copyWith(borderRadius: borderRadius);
    return this;
  }

  DecorationWrap color(Color color) {
    _decoration.copyWith(color: color);
    return this;
  }

  DecorationWrap image(DecorationImage image) {
    _decoration.copyWith(image: image);
    return this;
  }

  DecorationWrap shape(BoxShape shape) {
    _decoration.copyWith(shape: shape);
    return this;
  }

  DecorationWrap backgroundBlendMode(BlendMode backgroundBlendMode) {
    _decoration.copyWith(backgroundBlendMode: backgroundBlendMode);
    return this;
  }

  DecorationWrap shadows(List<BoxShadow> shadows) {
    _decoration.copyWith(boxShadow: shadows);
    return this;
  }

  DecorationWrap gradient(Gradient gradient) {
    _decoration.copyWith(gradient: gradient);
    return this;
  }

  DecorationWrap boxShadow(BoxShadow boxShadow) {
    _decoration.copyWith(boxShadow: [boxShadow]);
    return this;
  }

  DecoratedBox build() {
    return DecoratedBox(decoration: _decoration, child: _child);
  }
}
