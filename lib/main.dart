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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, child){
              print('test2');
              return Text(
                ref.watch(_mydataProvider).toString(),
                style: TextStyle(fontSize: 100),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child){
              
              print('test1');
              return Slider(
                value: ref.watch(_mydataProvider),
                onChanged: (value){
                  ref.read(_mydataProvider.notifier).changState(value);
                }
              );
            },
          )
        ]
      ),
    );
  }
}