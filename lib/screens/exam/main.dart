import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as base;
import 'package:mobile_exam/core/app/view.dart' as view;
import 'package:provider/provider.dart';
import 'bloc.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  ExamBloc? _bloc;

  @override
  void dispose() {
    _bloc?.close().then((b) => b.dispose());
    _bloc = null; // remove reference
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _bloc ?? (_bloc = ExamBloc(context)),
      builder: (context, _) {
        return WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(context.strings.examAppBarTitle),
            ),
            body: SafeArea(
              child: base.BlocBuilder<ExamBloc, view.ViewState>(
                builder: (context, state) => state.view(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
