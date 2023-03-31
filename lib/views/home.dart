import 'package:edrelf_main_project/models/Earthquakes.dart';
import 'package:edrelf_main_project/widgets/earthquake_card.dart';
import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Earthquakes earthquakes = Earthquakes();

  
  askUsersLocation() async{
    PermissionStatus permission = await LocationPermissions().requestPermissions();//asks permission for getting users location
    print(permission);
  
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Earthquakes.getAllEarthquakes();
    askUsersLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eatrhquakes'),
      actions: <Widget>[
        IconButton(
          onPressed: ()=> Navigator.of(context).pushNamed('/show-all-routes'),
          icon: Icon(Icons.map),
        ),
        IconButton(
          onPressed: ()=> null,
          icon: Icon(Icons.info),
        ),

      ],
      ),
      body: ListView(
        children: <Widget>[
          EarthquakeCard(earthquakes: earthquakes),
          EarthquakeCard(earthquakes: earthquakes),
          EarthquakeCard(earthquakes: earthquakes),
          EarthquakeCard(earthquakes: earthquakes),
          EarthquakeCard(earthquakes: earthquakes),

        ]
      )
    );
  }
}