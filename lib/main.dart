
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NameScreen(),
    );
  }
}

class NameScreen extends StatefulWidget {
  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Enter your name',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: nameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Your name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    String name = nameController.text.trim();

                    if (name.isNotEmpty) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation,
                              secondaryAnimation) {
                            return HelloScreen(name: name);
                          },
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Go',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelloScreen extends StatelessWidget {
  final String name;

  HelloScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Text(
          'Hello, $name !',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
