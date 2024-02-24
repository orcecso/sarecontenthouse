import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;

class LoadingExamState extends base.ViewState {
  @override
  Widget content(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
