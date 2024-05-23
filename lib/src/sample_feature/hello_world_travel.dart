import 'package:flutter/material.dart';

class HelloWorldTravel extends StatelessWidget {
  const HelloWorldTravel({super.key});

  static const String title = 'Hello World Travel App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Hello World Travel",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Discover the World',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.network(
                  'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                  height: 350,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () => contactUs(context),
                    child: const Text('Contact Us')),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void contactUs(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Contact Us'),
            content: const Text('Mail us at hello@world.com'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'))
            ],
          );
        });
  }
}
