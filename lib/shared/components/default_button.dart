import 'package:flutter/material.dart';
import 'package:green/shared/styles/colors.dart';

class DefaultButton extends StatelessWidget {
  final double? height;
  final double? minWidth;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
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

  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;
  final ButtonTextTheme? textTheme;
  final Duration? duration;
  final Clip clipBehavior;
  final Brightness? colorBrightness;

  final bool autoFocus;
  final bool enabledFeedback;

  final MaterialTapTargetSize? materialTapTargetSize;
  final FocusNode? focusNode;


  final MouseCursor? mouseCursor;
  final VisualDensity? visualDensity;

  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHighlightChanged;

  const DefaultButton({
    this.height,
    this.minWidth,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,

    this.color = Colors.green,
    this.textColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.disabledTextColor,

    this.shape,
    this.padding,
    this.textTheme,
    this.duration,
    this.clipBehavior = Clip.none,
    this.colorBrightness,

    this.autoFocus = false,
    this.enabledFeedback = true,

    this.materialTapTargetSize,
    this.focusNode,

    this.mouseCursor,
    this.visualDensity,

    this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,

    this.child,

    Key? key,
  }) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: minWidth,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,

      color: color,
      textColor: textColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      shape: shape,
      padding: padding,
      textTheme: textTheme,
      animationDuration: duration,
      clipBehavior: clipBehavior,
      colorBrightness: colorBrightness,

      autofocus: autoFocus,
      enableFeedback: enabledFeedback,

      materialTapTargetSize: materialTapTargetSize,
      focusNode: focusNode,

      mouseCursor: mouseCursor,
      visualDensity: visualDensity,

      onPressed: onPressed,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,

      key: key,

      child: child,
    );
  }
}
