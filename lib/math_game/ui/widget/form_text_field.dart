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
        SizedBox(
          width: 30,
          child: TextFormField(
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(counter: SizedBox()),
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
