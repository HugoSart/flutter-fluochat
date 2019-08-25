import 'package:fluochat/view/pages/call_page.dart';
import 'package:fluochat/view/pages/camera_page.dart';
import 'package:fluochat/view/pages/chat_page.dart';
import 'package:fluochat/view/pages/status_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluoChat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'FluoChat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int numberOfNewMessages = 0;

  @override
  void initState() {
    numberOfNewMessages = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('FluoChat'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Icon(Icons.camera_alt, color: Color.fromRGBO(255, 255, 255, 0.5)),
              ),
              Tab(
                child: Row(
                  children: <Widget>[
                    Text('CONVERSAS'),
                    Container(
                      margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                            ),
                            width: 18,
                            height: 18,
                          ),
                          Text(
                            numberOfNewMessages.toString(),
                            style: TextStyle(
                                fontSize: 10,
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: <Widget>[
                    Text('STATUS'),
                    Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(18)),
                        ),
                        width: 6,
                        height: 6,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: <Widget>[
                    Text('CHAMADAS'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CameraPage(),
          ChatPage(),
          StatusPage(),
          CallPage(),
        ]),
      ),
    );
  }

}
