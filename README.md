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
The latest version is <a href="https://pub.dev/packages/widgets_extension">
    <img src="https://img.shields.io/pub/v/widgets_extension.svg"/>
</a>

```yaml
   dependencies:
     widgets_extension: @latest

   import "package:widgets_extension/widgets_extension.dart";
```

#### Widget before
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
#### Widget after
```dart
  Column(
    children: [
      Text('text').fontSize(14).fontColor(Colors.white).bold(),
      selectIndexGroup.builder((value, child) {
         return Text('${value}').align(Alignment.center);
      }).expanded(),
      Text('type')
        .width(100).height(100)
        .showIf(type != null),
    ],
  ).backgroundColor(Colors.blue)
    .padding(all: 10, vertical: 5)
    .radius(10)
    .onTap(() {
      print('tap');
    });
```
---
#### Text before
```dart
            Text(
              "猜你想看",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
```

#### Text after
```dart
            Text("猜你想看")
              .fontSize(16)
              .fontColor(Colors.white)
              .w600()
              .maxLines_(1)
              .overflow_(TextOverflow.ellipsis);
```
---
#### Decoration before
```dart
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.dp),
                  color: const Color(0xffFBF5EC),
                  border: Border.all(
                    color: const Color(0xffA5712A),width: 1.dp),
                  ),
                padding: EdgeInsets.symmetric(horizontal: 6.dp, vertical: 3.dp),
                child: Text(
                  "decoration", 
                  style: TextStyle(fontSize: 14.sp, color: const Color(0xffA5712A))
                )
              )
```
#### Decoration after
```dart
              Text("decoration")
                .fontSize(14)
                .fontColor(const Color(0xffA5712A))
                .padding(horizontal: 6.dp, vertical: 3.dp)
                .decoration()
                .borderRadius(BorderRadius.circular(6))
                .color(const Color(0xffFBF5EC))
                .border(
                  Border.all(color: const Color(0xffA5712A),width: 1.dp),
                 )
                .build(),

              ---or---

              Text("decorated")
                .fontSize(14)
                .fontColor(const Color(0xffA5712A))
                .padding(horizontal: 6.dp, vertical: 3.dp)
                .decorated(BoxDecoration(
                  borderRadius: BorderRadius.circular(6.dp),
                  color: const Color(0xffFBF5EC),
                  border: Border.all(
                    color: const Color(0xffA5712A),width: 1.dp),
                  ),
                )
```
需要注意调用顺序，先调用的先添加到组件树中,比如：
```dart
// 无效
widget
    .width(100)
    .height(100)
    .center()

// 有效
widget
    .center()
    .width(100)
    .height(100)
```
## 支持的组件扩展方法：
### 通用组件扩展
- showIf: 根据条件显示组件
- onTap: 添加点击事件
- onDoubleTap: 添加双击事件
- onLongPress: 添加长按事件
- size: 设置宽高
- width: 设置宽度
- height: 设置高度
- constraint: 设置约束
- decoration: 设置装饰
- decorated: 设置装饰
- backgroundColor: 设置背景颜色
- radius: 设置圆角
- scrollable: 设置可滚动
- safeArea: 设置安全区域
- padding: 设置内边距
- expanded: 将组件设置为Expanded
- align: 设置对齐方式
- center: 设置组件居中对齐
- rotate: 旋转组件（参数为旋转角度）
- translate: 平移组件（参数为dx和dy偏移量）
- scale: 缩放组件
- scaleX: 水平缩放组件
- scaleY: 垂直缩放组件
- transform: 对组件进行变换
- opacity: 设置透明度
- aspectRatio: 设置宽高比
- ignore: 忽略指针事件
- absorb: 阻止指针事件
- intrinsicWidth: 设置组件宽度为内容宽度
- intrinsicHeight: 设置组件高度为内容高度
- backdropBlur: 添加背景模糊效果
- blur: 添加模糊效果

### Text组件扩展
- fontSize: 设置字体大小
- color: 设置字体颜色
- bold: 设置字体为粗体
- w500: 设置字体权重为500
- w600: 设置字体权重为600
- fontWeight: 设置字体权重
- italic: 设置字体为斜体
- underline: 为文字添加下划线
- lineThrough: 为文字添加删除线
- ellipsis: 为文字添加省略号
- maxLines: 设置最大行数
- overflow: 设置文本溢出处理方式
- textAlign: 设置文本对齐方式
- textDirection: 设置文本方向
....

### 装饰器扩展
- border: 设置边框
- borderRadius: 设置圆角
- color: 设置背景颜色
- image: 设置装饰图片
- shape: 设置形状
- backgroundBlendMode: 设置背景混合模式
- shadows: 设置阴影列表
- gradient: 设置渐变
- boxShadow: 设置单个阴影
- build: 构建最终的Widget组件
