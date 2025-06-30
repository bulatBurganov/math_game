import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    super.key,
    this.onChange,
    this.size = 24,
    required this.value,
    this.title,
  });

  final ValueChanged<bool>? onChange;
  final bool value;
  final double size;
  final String? title;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppCheckBox oldWidget) {
    if (widget.value != oldWidget.value) {
      setState(() {
        _value = widget.value;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChange?.call(_value);
        });
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: _value
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              border: Border.all(
                color: _value
                    ? Colors.transparent
                    : Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(widget.size / 6)),
            ),
            width: widget.size,
            height: widget.size,
            child: InkWell(
              child: Center(
                child: _value
                    ? Icon(
                        Icons.check,
                        size: widget.size * 0.8,
                        color: Theme.of(context).primaryColor,
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
          SizedBox(width: widget.title != null ? 15.0 : 0.0),
          widget.title != null
              ? Expanded(
                  child: Text(
                    widget.title!,
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
