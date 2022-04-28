import 'package:flutter/material.dart';
import 'package:my_flutter_test/ioc.dart';
import 'package:my_flutter_test/screens/counter/counter_viewmodel.dart';
import 'package:my_flutter_test/utils/screen_state.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  final CounterViewModel _counterViewModel = getIt<CounterViewModel>();

  CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: ChangeNotifierProvider(
        create: (_) {
          return _counterViewModel;
        },
        child: Center(
          child: Consumer<CounterViewModel>(
            builder: (context, viewModel, child) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Current Value:',
                      ),
                      Text(
                        '${viewModel.value}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () => viewModel.onIncrease(),
                                child: const Text('+')),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () => viewModel.onDecrease(),
                                child: const Text('-')),
                          )
                        ],
                      )
                    ],
                  ),
                  viewModel.currentValue.event == ScreenEvent.LOADING
                      ? const Text('Loading')
                      : Container(),
                  viewModel.currentValue.event == ScreenEvent.FAILED
                      ? Text(viewModel.currentValue.message ?? 'Ooops')
                      : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
