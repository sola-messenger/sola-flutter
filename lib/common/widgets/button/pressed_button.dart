// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:sola/common/style/app_colors.dart';

class PressedButton extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? pressedColor;
  final Color? hoverColor;
  final Color? disabledColor;
  final VoidCallback? onPressed;
  final Widget? child;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final MouseCursor? mouseCursor;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;

  PressedButton(
      {Key? key,
      this.padding,
      this.margin,
      this.color = AppColors.mainBlueColor,
      this.child,
      this.pressedColor = AppColors.mainBlueColor,
      this.hoverColor = AppColors.mainBlueColor,
      this.disabledColor = const Color(0xFFEDEDED),
      this.border,
      this.gradient,
      this.borderRadius,
      this.mouseCursor,
      this.shape,
      this.boxShadow,
      required this.onPressed,
      double? width,
      double? height,
      BoxConstraints? constraints})
      : assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(constraints == null || constraints.debugAssertIsValid()),
        constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        super(key: key);

  @override
  _PressedButtonState createState() => _PressedButtonState();

  bool get enabled => onPressed != null;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'));
  }
}

class _PressedButtonState extends State<PressedButton>
    with TickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 10);
  static const Duration kFadeInDuration = Duration(milliseconds: 10);

  bool _hovering = false;
  final bool _hasFocus = false;

  AnimationController? _pressAnimController;

  @override
  void initState() {
    super.initState();
    _pressAnimController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pressAnimController!.dispose();
    _pressAnimController = null;
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleMouseEnter(PointerEnterEvent event) {
    _hovering = true;
    if (widget.enabled) {
      _mouseAnimate();
    }
  }

  void _handleMouseExit(PointerExitEvent event) {
    _hovering = false;
    // If the exit occurs after we've been disabled, we still
    // want to take down the highlights and run widget.onHover.
    _mouseAnimate();
  }

  void _mouseAnimate() {
    if (_pressAnimController!.isAnimating) return;
    final bool wasMouse = _hovering;
    final TickerFuture tickerFuture = _hovering
        ? _pressAnimController!.animateTo(1.0, duration: kFadeOutDuration)
        : _pressAnimController!.animateTo(0.0, duration: kFadeInDuration);
    tickerFuture.then<void>((void value) {
      if (mounted && wasMouse != _hovering) _mouseAnimate();
    });
  }

  void _animate() {
    if (_pressAnimController!.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _pressAnimController!.animateTo(1.0, duration: kFadeOutDuration)
        : _pressAnimController!.animateTo(0.0, duration: kFadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;
    final Color backgroundColor = widget.color ?? Colors.transparent;
    final Color? pressColor = widget.pressedColor ?? Colors.grey[100];
    final Color? hoverColor = widget.hoverColor ?? Colors.grey[50];
    Widget? current = DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        child: widget.child ?? Container());

    if (widget.padding != null) {
      current = Padding(
        padding: widget.padding!,
        child: current,
      );
    }

    if (widget.child == null &&
        (widget.constraints == null || !widget.constraints!.isTight)) {
      current = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    }

    if (widget.constraints != null) {
      current =
          ConstrainedBox(constraints: widget.constraints!, child: current);
    }

    final MouseCursor effectiveMouseCursor =
        MaterialStateProperty.resolveAs<MouseCursor>(
      widget.mouseCursor ?? MaterialStateMouseCursor.clickable,
      <MaterialState>{
        if (!enabled) MaterialState.disabled,
        if (_hovering && enabled) MaterialState.hovered,
        if (_hasFocus) MaterialState.focused,
      },
    );

    current = MouseRegion(
      cursor: effectiveMouseCursor,
      onEnter: _handleMouseEnter,
      onExit: _handleMouseExit,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: enabled ? widget.onPressed : () {},
        child: Semantics(
          button: true,
          child: AnimatedBuilder(
            builder: (BuildContext context, Widget? child) {
              return DecoratedBox(
                decoration: BoxDecoration(
                    color: widget.gradient != null
                        ? null
                        : !enabled
                            ? widget.disabledColor ?? Colors.grey
                            : Color.lerp(
                                backgroundColor,
                                _buttonHeldDown ? pressColor : hoverColor,
                                _pressAnimController!.value),
                    border: widget.border,
                    boxShadow: widget.boxShadow,
                    shape: widget.shape ?? BoxShape.rectangle,
                    borderRadius: widget.borderRadius,
                    gradient: widget.gradient),
                child: child,
              );
            },
            child: current,
            animation: _pressAnimController!,
          ),
        ),
      ),
    );
    if (widget.margin != null) {
      current = Padding(
        padding: widget.margin!,
        child: current,
      );
    }
    return current;
  }
}
