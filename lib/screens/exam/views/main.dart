import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/screens/exam/bloc.dart';

class ExamViewState extends base.ViewState {
  final int counter;

  ExamViewState(this.counter);

  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/press.jpeg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              context.strings.pressTheButtonMagic,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.bloc.incrementCounter(1);
            },
            child: Text('Counter: $counter'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.bloc.resetCounter();
            },
            child: const Text('Reset Counter'),
          ),
        ],
      ),
    );
  }
}
