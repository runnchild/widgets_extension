# widgets_extension
<a href="https://pub.dev/packages/widgets_extension">
  <img src="https://img.shields.io/pub/v/widgets_extension.svg"/>
</a>
<a href="https://flutter.dev/">
  <img src="https://img.shields.io/badge/flutter-%3E%3D%203.0.0-green.svg"/>
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
</a>

A Widgets extension Flutter project that helps you write cleaner, more readable Flutter code with less nesting using extension methods.

- 告别层层嵌套：大幅减少代码的缩进层级。
- 代码更简洁：代码更加紧凑、易于理解。
- 专注于业务：专注于核心业务逻辑的实现。
## Getting Started
```yaml
   dependencies:
     widgets_extension: ^1.0.2

import "package:widgets_extension/widgets_extension.dart";
```

before
```dart
    GestureDetector(
      onTap: () {
        print('tap');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.dp, vertical: 5.dp),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              'text',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: selectIndexGroup,
                builder: (context, value, child) {
                  return  Container(
                    alignment: Alignment.center,
                    child: Text('${value}'),
                  );
                }
              ),
            ),
            type != null
                ? SizedBox(
              width: 100,
              height: 100,
              child: Align(
                alignment: Alignment.center,
                child: Text('type'),
              ),
            )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
```
after
```dart
Container(
  child: Column(
    children: [
      Text('text').fontSize(14).color(Colors.white).bold(),
      selectIndexGroup.builder((value, child) {
         return Text('${value}').align(Alignment.center);
      }).expanded(),
      Text('type')
        .width(100).height(100)
        .showIf(type != null)
    ],
  ),
).backgroundColor(Colors.blue)
    .padding({ all: 10, vertical: 5 })
    .radius(10)
    .onTap(() {
      print('tap');
    });
```
需要注意调用顺序，先调用的先添加到组件树中