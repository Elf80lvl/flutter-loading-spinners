import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? spinkit
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('The app is loaded'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        //Load data
                        await Future.delayed(
                          const Duration(seconds: 3),
                        );

                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const Text('Load data (simulated)'))
                ],
              ),
            ),
    );
  }
}
