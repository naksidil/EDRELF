import 'dart:convert';
import 'package:http/http.dart' as http;

class Earthquakes{
  final String? date;
  final String? hour;
  final String? latitude;
  final String? longitude;
  final String? depth;
  final String? md;
  final String? ml;
  final String? mw;
  final String? place;
  final String? solution;

Earthquakes({
  this.date,
  this.hour,
  this.latitude,
  this.longitude,
  this.depth,
  this.md,
  this.ml,
  this.mw,
  this.place,
  this.solution
});

factory Earthquakes.fromJson(Map<String, dynamic> json){
  return Earthquakes(
  date: json['date'],
  hour: json['hour'],
  latitude: json['latitude'],
  longitude: json['longitude'],
  depth: json['depth'],
  md: json['md'],
  ml: json['ml'],
  mw: json['mw'],
  place: json['place'],
  solution: json['solution']
  );
}

  
static Future<List<Earthquakes>> getAllEarthquakes() async{
  var response = await http.get(Uri.parse('http://hasanadiguzel.com.tr/api/sondepremler'));
  if(response.statusCode == 200){
    List<dynamic> body = json.decode(response.body);
    List<Earthquakes> earthquakes = body.map((item) => Earthquakes.fromJson(item)).toList();
    return earthquakes;
  } 
  else {
    throw Exception('Failed to load earthquakes');
  }
}

}