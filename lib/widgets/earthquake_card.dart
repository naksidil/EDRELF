import 'package:edrelf_main_project/models/Earthquakes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EarthquakeCard extends StatelessWidget {
  final Earthquakes earthquakes;
  EarthquakeCard({required this.earthquakes});

  @override
  Widget build(BuildContext context) {

      return Container(
            color: Colors.grey[400],
            child: ListTile(
              title: Text(
               'place', 
                style: TextStyle(fontSize: 20),
                ),
              subtitle: 
             Text('intensity: xx, depth: yy'),
              
            
              trailing: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.map),
                onPressed: () => null,
                tooltip: 'Show on map',
                ),
            ),
        );
           

  }
}