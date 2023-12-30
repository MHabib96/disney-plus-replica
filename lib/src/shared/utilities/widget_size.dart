import 'package:flutter/widgets.dart';

class WidgetSize extends StatelessWidget {
  WidgetSize({super.key, required this.builder, this.child});

  final ValueNotifier<Size> notifier = ValueNotifier(const Size(0, 0));
  final Widget Function(BuildContext context, Size size, Widget? child) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => notifier.value = (context.findRenderObject() as RenderBox).size,
    );

    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: builder,
      child: child,
    );
  }
}
