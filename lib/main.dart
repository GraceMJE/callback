import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: const Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count : $value',
          style: const TextStyle(fontSize: 30),
        ),
        TestButton(addCounter),
      ]
    );
  }

  // callback위한 코드
  void addCounter() {
    setState(() => ++value);

  }
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  // 반환값이 없는 콜백
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: InkWell( // UI적으로 InkWell , 다양한입력 Gesture
          onTap: () => callback.call(),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(border: Border.all()),
              child: const Text(
                'UP COUNTER',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
    );
  }
}
