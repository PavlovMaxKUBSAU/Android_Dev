import 'package:flutter/cupertino.dart';
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
      home: MyHomePage(title: 'КубГАУ'),
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
  static int _counter = 5;
  static const IconData empty_heart = CupertinoIcons.heart;
  static const IconData red_heart = CupertinoIcons.heart_fill;

  void likeFunc()
  {
    setState(() {
      if (_counter==5)
      {
        _counter++;
      }
      else
      {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),

        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Image.asset('assets/1.jpg'),
                  Container(padding: const EdgeInsets.fromLTRB(0,0,20,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: 250,
                            child: ListTile(
                              title: Text('Главный корпус'),
                              subtitle: Text('г. Краснодар, ул. Калинина, 13'),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton (
                                icon: Icon(_counter == 5? empty_heart: red_heart),
                                color: _counter == 5? null: Colors.red,
                                onPressed: ()
                                {
                                  likeFunc();
                                },
                              ),
                              Text('$_counter'),
                            ],
                          ),
                        ],
                    ),
                  ),
                  Container(padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Column(
                          children: const [
                            Icon(Icons.phone_android, size: 35),
                            Text('Позвонить', style: TextStyle(color: Colors.green, fontSize: 18))
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.route_outlined, size: 35),
                            Text('Маршрут', style: TextStyle(color: Colors.green, fontSize: 18))
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(Icons.share, size: 35),
                            Text('Поделиться', style: TextStyle(color: Colors.green, fontSize: 18))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: const Text(
                          '    Кубанский государственный аграрный университет — один из признанных лидеров высшего аграрного образования в России, крупнейший в ЮФО центр науки, образования и инноваций:'
                              '\n  - Головная организация Кубанского государственного аграрного научно-образовательного объединения;'
                              '\n  - Система менеджмента качества университета соответствует требованиям международного стандарта ИСО 9001:2015;'
                              '\n  - Занимает по рейтингу Роспатента лидирующее место среди вузов и НИИ аграрного профиля и входит в первую тройку крупнейших патентообладателей России;'
                              '\n  - Награжден орденом Трудового Красного Знамени;'
                              '\n  - Награжден благодарностью Президента РФ «За вклад в сельскохозяйственную науку и подготовку высококвалифицированных специалистов».',
                      style: TextStyle(fontSize: 18))
                  )
                ],
              ),
            )
        )
    );
  }
}
