import 'dart:js';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_app/mydata.dart';

final _mydataProvider = StateNotifierProvider<MyData, double>((ref){
  return MyData();
});
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: MyHomePage(title: 'Flutter demo')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!)
      ),
      body: MyContents()
    );
  }
}

class MyContents extends HookConsumerWidget {
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _value = ref.watch(_mydataProvider);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _value.toStringAsFixed(2),
          style: TextStyle(fontSize: 100),
        ),
        Slider(
          value: ref.read(_mydataProvider),
          onChanged: (value){
            ref.watch(_mydataProvider.notifier).changState(value);
          }
        )
      ],
    );
  }
}
