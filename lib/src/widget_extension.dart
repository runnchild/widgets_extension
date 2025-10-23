import 'package:flutter/gestures.dart' show DragStartBehavior, GestureDoubleTapCallback;
import 'package:flutter/material.dart';
import 'package:widgets_extension/src/widget/decoration_wrap.dart';

extension WidgetExtension on Widget {
  Widget onTap(
    VoidCallback? onTap, {
    HitTestBehavior behavior = HitTestBehavior.translucent,
  }) {
    GestureDoubleTapCallback? onDoubleTap;
    GestureLongPressCallback? onLongPress;
    Widget? child;
    if (this is GestureDetector) {
      var detector = (this as GestureDetector);
      onDoubleTap = detector.onDoubleTap;
      onLongPress = detector.onLongPress;
      child = detector.child;
    }
    return GestureDetector(
      behavior: behavior,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: child?? this,
    );
  }

  Widget onDoubleTap(
    VoidCallback? onDoubleTap, {
    HitTestBehavior behavior = HitTestBehavior.translucent,
  }) {
    GestureTapCallback? onTap;
    GestureLongPressCallback? onLongPress;
    Widget? child;
    if (this is GestureDetector) {
      var detector = (this as GestureDetector);
      onTap = detector.onTap;
      onLongPress = detector.onLongPress;
      child = detector.child;
    }
    return GestureDetector(
      behavior: behavior,
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: child?? this,
    );
  }

  Widget onLongPress(
    VoidCallback? onLongPress, {
    HitTestBehavior behavior = HitTestBehavior.translucent,
  }) {
    GestureTapCallback? onTap;
    GestureDoubleTapCallback? onDoubleTap;

    Widget? child;
    if (this is GestureDetector) {
      var detector = (this as GestureDetector);
      onTap = detector.onTap;
      onDoubleTap = detector.onDoubleTap;
      child = detector.child;
    }

    return GestureDetector(
      behavior: behavior,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: child?? this,
    );
  }

  Widget size({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget width(double width) {
    double? height;
    if (this is SizedBox) {
      height = (this as SizedBox).height;
    }
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget height(double height) {
    double? width;
    if (this is SizedBox) {
      width = (this as SizedBox).width;
    }
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  Widget padding(
      {double all = 0,
      double? horizontal,
      double? vertical,
      double? left,
      double? top,
      double? right,
      double? bottom}) {
    return Padding(
      padding: EdgeInsets.all(all).copyWith(
        left: horizontal ?? left,
        top: vertical ?? top,
        right: horizontal ?? right,
        bottom: vertical ?? bottom,
      ),
      child: this,
    );
  }

  Widget expanded([double? flex]) {
    return Expanded(
      flex: flex?.toInt() ?? 1,
      child: this,
    );
  }

  Widget positioned(
      {double? left,
      double? top,
      double? right,
      double? bottom,
      double? width,
      double? height}) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  Widget align([AlignmentGeometry? alignment]) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  Widget constraint({
    double? maxWidth,
    double? maxHeight,
    double? minWidth,
    double? minHeight,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
        minWidth: minWidth ?? 0,
        minHeight: minHeight ?? 0,
      ),
      child: this,
    );
  }

  Widget safeArea({bool? top, bool? bottom, bool? left, bool? right}) {
    return SafeArea(
      top: top ?? true,
      bottom: bottom ?? true,
      left: left ?? true,
      right: right ?? true,
      child: this,
    );
  }

  Widget showIf(bool condition) {
    return condition ? this : const SizedBox.shrink();
  }

  Widget radius(double radius,
      {double? topLeft,
      double? topRight,
      double? bottomLeft,
      double? bottomRight}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius).copyWith(
        topLeft: Radius.circular(topLeft ?? radius),
        topRight: Radius.circular(topRight ?? radius),
        bottomLeft: Radius.circular(bottomLeft ?? radius),
        bottomRight: Radius.circular(bottomRight ?? radius),
      ),
      child: this,
    );
  }

  Widget backgroundColor(Color color) {
    return ColoredBox(color: color, child: this);
  }

  DecorationWrap decoration() {
    return DecorationWrap(child: this);
  }

  Widget decorated(Decoration decoration) {
    return DecoratedBox(decoration: decoration, child: this);
  }

  Widget rotate(double angle, {AlignmentGeometry? alignment}) {
    return Transform.rotate(
      angle: angle,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  Widget translate({double? x, double? y}) {
    return Transform.translate(
      offset: Offset(x ?? 0, y ?? 0),
      child: this,
    );
  }

  Widget scale(double scale, {AlignmentGeometry? alignment}) {
    return Transform.scale(
      scale: scale,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  Widget scaleX(double scaleX, {AlignmentGeometry? alignment}) {
    return Transform.scale(
      scaleX: scaleX,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  Widget scaleY(double scaleY, {AlignmentGeometry? alignment}) {
    return Transform.scale(
      scaleY: scaleY,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  Widget transform(Matrix4 transform,
      {AlignmentGeometry? alignment, Offset? origin}) {
    return Transform(
      transform: transform,
      alignment: alignment,
      origin: origin,
      child: this,
    );
  }

  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    EdgeInsetsGeometry? padding,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      primary: primary,
      physics: physics,
      controller: controller,
      dragStartBehavior: dragStartBehavior,
      padding: padding,
      child: this,
    );
  }

  Widget center({double? widthFactor, double? heightFactor}) {
    return Center(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: this,
    );
  }
}

extension NotifierExt<T> on ValueNotifier<T> {
  Widget builder(Widget Function(T value, Widget? child) builder,
      {Widget? child}) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: (context, value, child) {
        return builder(value, child);
      },
      child: child,
    );
  }
}
