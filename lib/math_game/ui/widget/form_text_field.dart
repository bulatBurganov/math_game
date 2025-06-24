import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatefulWidget {
  final String initialValue;
  final Function(String value) onChanged;
  final String label;
  final List<TextInputFormatter>? inputFormatters;

  const FormTextField({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
    this.inputFormatters,
  });
  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.label, style: TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        SizedBox(
          width: 30,
          child: TextField(
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
