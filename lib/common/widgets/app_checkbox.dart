import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    Key? key,
    this.onChange,
    this.size = 24,
    required this.initialValue,
    this.title,
  }) : super(key: key);

  final ValueChanged<bool>? onChange;
  final bool initialValue;
  final double size;
  final String? title;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
          widget.onChange?.call(value);
        });
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: value
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              border: Border.all(
                color: value
                    ? Colors.transparent
                    : Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(widget.size / 6)),
            ),
            width: widget.size,
            height: widget.size,
            child: InkWell(
              child: Center(
                child: value
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
