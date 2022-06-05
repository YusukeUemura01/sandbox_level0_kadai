import 'package:flutter/material.dart';
import 'package:sandbox_level0/basic/basic_todopage.dart';
import 'package:sandbox_level0/from_firebase/from_firebase_todopage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialPage(),
    );
  }
}

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => const BasicTodoPage())),//firebaseを使わない方のtodoリスト
                child: const Text("ベーシック")
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => const FromFirebaseTodoPage())),//firebaseを使う方のtodoリスト
                child: const Text("from Firebase")
            ),
          ],
        ),
      ),
    );
  }
}



