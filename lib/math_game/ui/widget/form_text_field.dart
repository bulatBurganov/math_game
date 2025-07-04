import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatefulWidget {
  final String? value;
  final Function(String value) onChanged;
  final String label;
  final List<TextInputFormatter>? inputFormatters;

  const FormTextField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.inputFormatters,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FormTextField oldWidget) {
    if (oldWidget.value != widget.value) {
      print('${widget.value} ${widget.value.runtimeType}');
      _controller.text = widget.value ?? '';
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            textAlign: TextAlign.center,
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              isDense: true,
              constraints: BoxConstraints(maxWidth: 48, maxHeight: 32),
              counter: SizedBox(),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            controller: _controller,
            inputFormatters: widget.inputFormatters,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
