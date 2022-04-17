import 'package:flutter/widgets.dart';
import 'package:flutter_responsive_layout/flutter_responsive_layout.dart';

/// Wrapper around [Padding].
class ResponsivePadding extends BaseResponsiveWidget {
  final ResponsiveBreakpointData<EdgeInsets> data;
  final Widget child;

  ResponsivePadding({
    Key? key,
    EdgeInsets? xs,
    EdgeInsets? sm,
    EdgeInsets? md,
    EdgeInsets? lg,
    EdgeInsets? xl,
    required this.child,
  })  : data = ResponsiveBreakpointData(xs: xs, sm: sm, md: md, lg: lg, xl: xl),
        super(
          key: key,
        );

  @override
  Widget buildResponsive(BuildContext context, Breakpoints breakpoint) {
    final padding = data.getForBreakpoint(breakpoint);

    if (padding == null) return child;

    return Padding(
      padding: padding,
      child: child,
    );
  }
}
