import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/easyConcurrency'),
              child: const Text('Easy concurrency')),
          TextButton(onPressed: () => {}, child: const Text('Next screen')),
        ],
      ),
    );
  }
}
