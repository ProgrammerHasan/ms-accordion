library ms_accordion;

import 'package:flutter/material.dart';

class MsAccordion extends StatefulWidget {
  const MsAccordion({
    Key? key,
    this.titleChild,
    this.content,
    this.collapsedTitleBackgroundColor = MsColors.WHITE,
    this.expandedTitleBackgroundColor = const Color(0xFFE0E0E0),
    this.collapsedIcon = const Icon(Icons.keyboard_arrow_down),
    this.expandedIcon = const Icon(Icons.keyboard_arrow_up),
    this.title,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
    this.titlePadding = const EdgeInsets.all(10),
    this.contentBackgroundColor,
    this.contentPadding = const EdgeInsets.all(10),
    this.contentChild,
    this.titleBorder = const Border(),
    this.contentBorder = const Border(),
    this.margin,
    this.showAccordion = false,
    this.onToggleCollapsed,
    this.titleBorderRadius = const BorderRadius.all(Radius.circular(0)),
    this.contentBorderRadius = const BorderRadius.all(Radius.circular(0)),
  }) : super(key: key);

  final bool showAccordion;
  final Widget? titleChild;
  final String? content;
  final Widget? contentChild;
  final Color collapsedTitleBackgroundColor;
  final Color expandedTitleBackgroundColor;
  final Widget collapsedIcon;
  final Widget expandedIcon;
  final String? title;
  final TextStyle textStyle;
  final EdgeInsets titlePadding;
  final EdgeInsets contentPadding;
  final Color? contentBackgroundColor;
  final EdgeInsets? margin;
  final Border titleBorder;
  final Border contentBorder;
  final BorderRadius titleBorderRadius;
  final BorderRadius contentBorderRadius;
  final ValueChanged<bool>? onToggleCollapsed;

  @override
  State<MsAccordion> createState() => _MsAccordionState();
}

class _MsAccordionState extends State<MsAccordion>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController controller;
  late Animation<Offset> offset;
  late bool showAccordion;

  @override
  void initState() {
    super.initState();
    showAccordion = widget.showAccordion;

    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    controller =
        AnimationController(duration: const Duration(milliseconds: 300), vsync: this);

    offset = Tween(
      begin: const Offset(0, -0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: _toggleCollapsed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: widget.titleBorderRadius,
                border: widget.titleBorder,
                color: showAccordion
                    ? widget.expandedTitleBackgroundColor
                    : widget.collapsedTitleBackgroundColor,
              ),
              padding: widget.titlePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: widget.title != null
                        ? Text(widget.title!, style: widget.textStyle)
                        : (widget.titleChild ?? const SizedBox.shrink()),
                  ),
                  showAccordion ? widget.expandedIcon : widget.collapsedIcon
                ],
              ),
            ),
          ),
          if (showAccordion)
            Container(
              decoration: BoxDecoration(
                borderRadius: widget.contentBorderRadius,
                border: widget.contentBorder,
                color: widget.contentBackgroundColor ?? Colors.white70,
              ),
              width: MediaQuery.of(context).size.width,
              padding: widget.contentPadding,
              child: SlideTransition(
                position: offset,
                child: widget.content != null
                    ? Text(widget.content!)
                    : (widget.contentChild ?? const SizedBox.shrink()),
              ),
            ),
        ],
      ),
    );
  }

  void _toggleCollapsed() {
    setState(() {
      if (controller.status == AnimationStatus.completed) {
        controller.forward(from: 0);
      } else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      }
      showAccordion = !showAccordion;
      widget.onToggleCollapsed?.call(showAccordion);
    });
  }
}

class MsColors {
  static const Color PRIMARY = Color(0xff3880FF);
  static const Color SECONDARY = Color(0xffAA66CC);
  static const Color SUCCESS = Color(0xff10DC60);
  static const Color INFO = Color(0xff33B5E5);
  static const Color WARNING = Color(0xffFFBB33);
  static const Color DANGER = Color(0xffF04141);
  static const Color LIGHT = Color(0xffE0E0E0);
  static const Color DARK = Color(0xff222428);
  static const Color WHITE = Color(0xffffffff);
  static const Color FOCUS = Color(0xff434054);
  static const Color ALT = Color(0xff794c8a);
  static const Color TRANSPARENT = Colors.transparent;
}
