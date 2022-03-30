//import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Расчет площади треугольника'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int v1 = 0;
  int v2 = 0;
  Text txt = Text("");

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Основание:"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: TextFormField(validator: (value) {
                        if (value!.isEmpty || int.tryParse(value) == null)
                          return 'Введите числовую длину основания > 0';
                        else {
                          v1 = int.parse(value);
                          return null;
                        }
                      },
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Высота:"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: TextFormField(validator: (value) {
                        if (value!.isEmpty || int.tryParse(value) == null)
                          return 'Введите числовую высоту > 0';
                        else {
                          v2 = int.parse(value);
                          return null;
                        }
                      },
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    double S = v1 * v2 / 2;
                    if (S >= 0) {
                      txt = Text("S = $v1*$v2/2 = $S",
                          style: const TextStyle(color: Colors.blueAccent, fontSize: 42));
                    }
                    else {
                      txt = const Text("Ошибка! Введены 1 или 2 слишком больших значения",
                          style: TextStyle(color: Colors.redAccent, fontSize: 42));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: const Text(
                "Вычислить",
              ),
            ),
            txt,
          ],
        ),
      ),
    );
  }
}
