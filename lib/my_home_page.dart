import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final Map<Tab, Widget> _tabs = {
    const Tab(text: '1'): page1(),
    const Tab(text: '2'): page2(),
  };

  final GlobalKey _scaffold = GlobalKey();
  TabController _tabController;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.keys.toList(),
          ),
          centerTitle: true,
          leading: const Icon(Icons.directions_car),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _tabs.values.toList()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  static Widget page1() {
    return Container(
      child: Center(
        child: Text('page1'),
      ),
    );
  }

  static Widget page2() {
    return Container(
      child: Center(
        child: Text('page2'),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}
