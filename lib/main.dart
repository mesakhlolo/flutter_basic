import 'package:flutter/material.dart';
import 'next_page/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppExt(),
    );
  }
}

class MyAppExt extends StatefulWidget {
  const MyAppExt({super.key});

  @override
  State<MyAppExt> createState() => _MyAppExtState();
}

class _MyAppExtState extends State<MyAppExt> {
  String buttonName = 'Click cuy';
  int currentIndex = 0;
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        setState(() {
                          buttonName = 'Clicked';
                        });
                      },
                      child: Text(buttonName),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const NextPage(),
                            ),
                          );
                        });
                      },
                      child: Text(buttonName),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                },
                child: _isClicked
                    ? Image.asset('images/spiderman-compressed.jpg')
                    : Image.network(
                        'https://www.shutterstock.com/shutterstock/photos/1924127555/display_1500/stock-photo-summer-blue-sky-cloud-gradient-light-white-background-beauty-clear-cloudy-in-sunshine-calm-bright-1924127555.jpg'),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          )
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
