import 'package:flutter/material.dart';
import 'package:weathernaut/gen/strings.g.dart';

class EditNameDialog extends StatefulWidget {
  final String initialName;

  const EditNameDialog({super.key, required this.initialName});

  @override
  State<EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<EditNameDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Text(context.t.settings.updateNameTitle),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: context.t.settings.updateNameHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.t.settings.cancel),
        ),
        TextButton(
          onPressed: () {
            final text = _controller.text.trim();
            if (text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.t.settings.nameError)),
              );
              return;
            }
            Navigator.pop(context, text);
          },
          child: Text(context.t.settings.save),
        ),
      ],
    );
  }
}
