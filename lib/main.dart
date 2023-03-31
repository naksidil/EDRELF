import 'package:flutter/material.dart';
import 'package:edrelf_main_project/views/home.dart';
import 'package:edrelf_main_project/views/show_all_earthquakes.dart';
import 'package:url_launcher/url_launcher.dart';



// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNav(),
  ));
}

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Sayfa1(),
    MyApp(),
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'main page',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.location_city),
            label: 'earthquakes',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw '$url \'e erişilemedi';
  }
}

class Sayfa1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EDRELF")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("DONATE", style: TextStyle(fontSize: 20)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sayfa2()),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 90.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                primary: Colors.green),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("I\nNEED\nHELP", style: TextStyle(fontSize: 20)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sayfa3()),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 67.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                primary: Colors.red),
          ),
        ],
      )),
    );
  }
}

class Sayfa2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("last earthquakes")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              child: Text("afad", style: TextStyle(fontSize: 20)),
              onPressed: () {
                const url =
                    'https://www.kizilay.org.tr/ramazan/?utm_source=google&utm_medium=search&utm_campaign=Ramazan_Bagis_Kampanyasi_2023&utm_content=Yurtici_Fidye&gclid=CjwKCAjw_YShBhAiEiwAMomsEIff7BY7imlfpc8j7F1S8MJpQkLDMxtZlIJTVwDpG_H8UPB_FDs0jhoCSLYQAvD_BwE';
                launchURL(url);
              },
            ),
            ElevatedButton(
              child: Text("kızılay", style: TextStyle(fontSize: 20)),
              onPressed: () {
                const url = 'https://www.kizilay.org.tr/Bagis';
                launchURL(url);
              },
            ),
            ElevatedButton(
              child: Text("ahbap", style: TextStyle(fontSize: 20)),
              onPressed: () {
                const url = 'https://bagis.ahbap.org/bagis';
                launchURL(url);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Sayfa3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 3")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              child: Text("clean water", style: TextStyle(fontSize: 20)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sayfa4()),
              ),
            ),
            ElevatedButton(
              child: Text("clothes", style: TextStyle(fontSize: 20)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sayfa4()),
              ),
            ),
            ElevatedButton(
              child: Text("food", style: TextStyle(fontSize: 20)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sayfa4()),
              ),
            ),
            ElevatedButton(
              child: Text("hygiene products", style: TextStyle(fontSize: 20)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sayfa4()),
              ),
            ),
            ElevatedButton(
              child: Text("medical supplies", style: TextStyle(fontSize: 20)),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sayfa4()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[800],
       
      ),
      debugShowCheckedModeBanner: false,
      title: 'Earthquakes',
      home: Home(),
      routes: {
        '/show-all-routes': (context) => ShowAllEarthquakes()
      },
    );
  }
}


class Sayfa4 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayfa 4")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
    );
  }
}
