# nice_flutter_kit

A Flutter package that provides a way to do a responsive layout. This package uses a mobile-first
breakpoint approach.

### Usage

In order to use this package, you must wrap your app with `ResponsiveBreakpointsProvider`.

Example:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpointsProvider(
      child: MaterialApp(
        title: "Responsive app",
        home: Text("Home"),
      ),
    );
  }
}
```

This will provide the different breakpoints to the app. The breakpoints works be minimum window
width.

There are 5 breakpoints: `xs`, `sm`, `md`, `lg`, and `xl`.

The defaults values for those breakpoints are:

- xs: `0` (cannot be configured)
- sm: `460`
- md: `768`
- lg: `1024`
- xl: `1280`

These can be changed by passing an instance of `ResponsiveBreakpoints` to the `breakpoints` property
of `ResponsiveBreakpointsProvider`.

Widgets that depend on `ResponsiveBreakpointsProvider` will only be rebuilt when the current
breakpoint change, instead of whenever the window size changes.

### Responsive widgets

Multiple widgets are provided by the package. Pull requests are always welcome if you want to add
more widgets.

Responsive widgets all extends `BaseResponsiveWidget`, which provides the `buildResponsive` method,
that will be called with a `BuildContext` and the current `Breakpoints` to build the widget.

Responsive widgets usually takes a data for each breakpoint. This package is mobile-first, meaning
that if no data has been provided for the current breakpoint, the data of the next smaller non-null
breakpoint will be used.

For example, if the following data is provided to `ResponsivePadding`:

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsivePadding(
        sm: const EdgeInsets.all(11),
        xl: const EdgeInsets.all(31),
        child: const Text("Responsive padding")
    );
  }
}
```

In this example, if the current breakpoint is `md`, since we did not provide an `EdgeInsets` for
the `md` breakpoint, the value of the `sm` breakpoint will be used. If we hadn't provided a value
for the `sm` breakpoint, the child would have been used without adding any padding.

#### ResponsiveFlex

This widget is a wrapper around the `Flex` widget, which is the base widget of both `Row`
and `column`. This can be used to display a list of widget with a different direction, depending on
the current breakpoint.

This widget takes an instance of `ResponsiveFlexData` for each breakpoint.

#### ResponsiveFlexible

This widget is a wrapper around the `Flexible` widget, and should only be used as the child of
a `Flex` widget.

This widget takes an instance of `ResponsiveFlexibleData` for each breakpoint.
The `ResponsiveFlexibleData` represents the `Flexible` widget, and `ResponsiveExpandedData`, which
extends `ResponsiveFlexibleData`, represents the `Expanded` widget.

If there is no data for the current breakpoint, a `SizedBox.shrink()` will be returned.

#### ResponsivePadding

This widget is a wrapper around the `Padding` widget.

This widget takes an instance of `EdgeInsets` for each breakpoint.

If there is no data for the current breakpoint, the child will be directly returned, without any
padding.

#### ResponsiveSizedBox

This widget is a wrapper around the `Sizedbox` widget.

This widget takes an instance of `ResponsiveSizedBoxData` for each breakpoint.

If there is no data for the current breakpoint, a `SizedBox` with no width and no height will be
returned.

#### ResponsiveWidget

This is a simple widget that takes a `Widget` for each breakpoint and returns the widget for the
current breakpoint.

If there is no data for the current breakpoint, a `SizedBox.shrink()` will be returned.

#### ResponsiveBuilder

Same as `ResponsiveWidget`, but with `WidgetBuilder`, which is
a `Widget Function(BuildContext context)` instead of a `Widget`.
