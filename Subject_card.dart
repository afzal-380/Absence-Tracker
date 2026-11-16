import 'package:flutter/material.dart';
import 'Subject.dart';

class SubjectCard extends StatefulWidget {
  final Subject subject;
  final Function(String) onNameChanged;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  SubjectCard({
    required this.subject,
    required this.onNameChanged,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.subject.name);
  }

  @override
  void didUpdateWidget(SubjectCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.subject.name != oldWidget.subject.name) {
      _controller.text = widget.subject.name;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color cardColor;
    if (widget.subject.absences >= 8) {
      cardColor = Colors.red[100]!;
    } else if (widget.subject.absences >= 6) {
      cardColor = Colors.orange[100]!;
    } else {
      cardColor = Colors.white;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Subject Name',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: widget.onNameChanged,
            ),
            SizedBox(height: 8),
            Text(
              'Absences: ${widget.subject.absences}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: TextButton(
                      onPressed: widget.onDecrement,
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: TextButton(
                      onPressed: widget.onIncrement,
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
