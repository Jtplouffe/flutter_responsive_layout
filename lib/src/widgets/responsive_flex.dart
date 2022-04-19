import 'package:flutter/widgets.dart';
import 'package:flutter_gehry/flutter_gehry.dart';

/// Wrapper around [Flex].
/// For a [Row], use [ResponsiveBreakpointsData.horizontal], and for a [Column], use [ResponsiveBreakpointsData.vertical]
class ResponsiveFlex extends BaseResponsiveWidget {
  final ResponsiveBreakpointsData<ResponsiveFlexData> data;

  /// List of widget that will be passed to [Row.children] or [Column.children], depending on the current breakpoint
  final List<Widget> children;

  ResponsiveFlex({
    Key? key,
    ResponsiveFlexData? xs,
    ResponsiveFlexData? sm,
    ResponsiveFlexData? md,
    ResponsiveFlexData? lg,
    ResponsiveFlexData? xl,
    required this.children,
  })  : data = ResponsiveBreakpointsData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(key: key);

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final flexData = data.getForBreakpoint(breakpoint);

    if (flexData == null) return const SizedBox.shrink();

    return Flex(
      direction: flexData.direction,
      mainAxisAlignment: flexData.mainAxisAlignment,
      mainAxisSize: flexData.mainAxisSize,
      crossAxisAlignment: flexData.crossAxisAlignment,
      textDirection: flexData.textDirection,
      verticalDirection: flexData.verticalDirection,
      textBaseline: flexData.textBaseline,
      clipBehavior: flexData.clipBehavior,
      children: children,
    );
  }
}

class ResponsiveFlexData {
  /// Direction of the children, will be provided to [Flex.direction].
  final Axis direction;

  /// [MainAxisAlignment] that will be provided to [Flex.mainAxisAlignment].
  final MainAxisAlignment mainAxisAlignment;

  /// [MainAxisSize] that will be provided to [Flex.mainAxisSize].
  final MainAxisSize mainAxisSize;

  /// [CrossAxisAlignment] that will be provided to [Flex.crossAxisAlignment].
  final CrossAxisAlignment crossAxisAlignment;

  /// [TextDirection] that will be provided to [Flex.textDirection].
  final TextDirection? textDirection;

  /// [VerticalDirection] that will be provided to [Flex.verticalDirection].
  final VerticalDirection verticalDirection;

  /// [TextBaseline] that will be provided to [Flex.textBaseline].
  final TextBaseline? textBaseline;

  /// [Clip] that will be provided to [Flex.clipBehavior].
  final Clip clipBehavior;

  const ResponsiveFlexData({
    required this.direction,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  });

  const ResponsiveFlexData.horizontal({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  }) : direction = Axis.horizontal;

  const ResponsiveFlexData.vertical({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  }) : direction = Axis.vertical;
}
