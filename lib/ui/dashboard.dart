import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/ui/endpoint_card.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker'),
      ),
      body: ListView(
        children: [
          EndpointCard(endPoint: EndPoint.cases,value: 123,),
        ],
      ),
    );
  }
}
