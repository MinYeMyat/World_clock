import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime{

  late String location; //location name for the UI
  late String time; // th time in that location
  late String flag; // url to an asset flag icon
  late String url; //location url for API endpoint

  WorldTime({required this.location,required this.time,required this.flag,required this.url});

  Future<void> getTime() async {
    // Make the HTTP request
    http.Response response = await http.get(
      Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the response body as JSON
      Map<String, dynamic> data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      time = now.toString();
      
    } else {
      // If the request was not successful, print the error message
      print('Failed to load data: ${response.statusCode}');
    }
  }


}


