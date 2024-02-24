import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/extensions/common.dart';
import 'package:mobile_exam/core/extensions/map.dart';
import 'package:mobile_exam/core/services/server.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  ExamBloc get bloc => read<ExamBloc>();
}

class ExamBloc extends base.Bloc {
  int counter = 0;

  ExamBloc(BuildContext context)
      : super(loading_view.LoadingExamState(), context: context);

  @override
  void init() async {
    final arg = context.arguments;
    final key = arg?.tryGet("key");
    final service = context.server;

    if (key != await service.accessKey) {
      emit(error_view.ErrorExamState());
      return;
    }

    final data = await service.data;

    counter = data['count'] ?? 0;

    emit(main_view.ExamViewState(counter));
  }

  void incrementCounter(int value) async {
    final service = context.server;
    await service.addToCount(value);
    counter += value;
    emit(main_view.ExamViewState(counter));
  }

  void resetCounter() async {
    final service = context.server;
    counter = 0;
    await service.addToCount(-counter);
    emit(main_view.ExamViewState(counter));
  }
}
