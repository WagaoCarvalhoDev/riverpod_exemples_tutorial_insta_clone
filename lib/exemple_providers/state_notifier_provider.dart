import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

extension OptionalInfixAddition<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class CounterProvider extends StateNotifier<int?> {
  CounterProvider() : super(null);

  increment() => state = state == null ? 1 : state + 1;
}

final counterProvider =
    StateNotifierProvider<CounterProvider, int?>((ref) => CounterProvider());

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) {
              final counter = ref.watch(counterProvider);
              final text =
                  counter == null ? 'Press Button' : counter.toString();
              return Text(text);
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
