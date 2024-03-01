import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'japan', flag: 'japan.png', url: 'Asia/Tokyo', time: '');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }
  
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding : EdgeInsets.all(50.0),
        child:Center(
          child: Text(time)),
    ),
    );
  }
}
