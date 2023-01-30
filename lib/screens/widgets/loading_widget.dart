import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String progressText;

  const ProgressWidget(this.progressText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CircularProgressIndicator(color: Colors.black),
              const SizedBox(
                width: 20,
              ),
              Text(
                progressText,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
