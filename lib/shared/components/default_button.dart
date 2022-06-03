import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? minWidth;
  final double? height;
  final double? elevation;
  final double? disabledElevation;

  final Color? color;
  final Color? textColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final Color? disabledTextColor;

  final Widget? child;

  final Duration? duration;
  final ShapeBorder? shape;
  final Padding? padding;
  final TextTheme? textTheme;

  final bool? autoFocus;
  final bool? enabledFeedback;

  final MaterialTapTargetSize? materialTapTargetSize;
  final FocusNode? focusNode;

  final Clip? clipBehavior;
  final Brightness? colorBrightness;

  final MouseCursor? mouseCursor;
  final VisualDensity? visualDensity;

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function()? onHighlightChanged;

  final Key? key;

  DefaultButton({
    this.
})

  const DefaultButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Text('Default Button'),
      color: Colors.blue,
      height: 15.0,
      key: null,
      animationDuration: Duration(milliseconds: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.all(0.0),
      textColor: Colors.white,
      elevation: 0.0,
      textTheme: ButtonTextTheme.normal,
      focusColor: Colors.blue,
      hoverColor: Colors.blue,
      highlightColor: Colors.blue,
      splashColor: Colors.blue,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      focusNode: null,
      autofocus: false,
      clipBehavior: Clip.none,
      colorBrightness: Brightness.dark,
      disabledColor: Colors.blue,
      disabledElevation: 0.0,
      disabledTextColor: Colors.blue,
      enableFeedback: true,
      focusElevation: 0.0,
      hoverElevation: 0.0,
      highlightElevation: 0.0,
      minWidth: double.infinity,
      mouseCursor: MouseCursor.defer,
      onLongPress: null,
      onHighlightChanged: null,
      visualDensity: VisualDensity.adaptivePlatformDensity,

    );
  }
}
