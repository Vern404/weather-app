import 'package:flutter/material.dart';
import 'package:weather/pages/weather_detail.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState((() =>
      _isCityNameEmpty = _controller.text.isEmpty)); //inline function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please enter city name',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  // hintText: 'Enter City Name',
                  label: Text('City Name'),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _isCityNameEmpty ? null: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherDetails(
                            cityName: _controller.text,
                        ),
                    ),
                );
              },
              child: const Text('Search'))
          ],
        ),
      ),
    );
  }
}
