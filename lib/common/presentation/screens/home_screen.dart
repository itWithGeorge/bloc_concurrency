import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/easyConcurrency'),
                child: const Text('Bloc concurrency')),
            TextButton(
                onPressed: () => Navigator.of(context).pushNamed('/easyCubit'),
                child: const Text('Cubit concurrency')),
          ],
        ),
      ),
    );
  }
}
