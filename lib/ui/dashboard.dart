import 'dart:io';

import 'package:coronavirus_rest_api_flutter_course/app/repositories/data_repositories.dart';
import 'package:coronavirus_rest_api_flutter_course/app/repositories/endpoints_data.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/ui/endpoint_card.dart';
import 'package:coronavirus_rest_api_flutter_course/ui/last_updated_status_text.dart';
import 'package:coronavirus_rest_api_flutter_course/ui/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  EndPointsData? _endPointsData;

  @override
  initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRepository = Provider.of<DataRepository>(context, listen: false);
      final endPointsData = await dataRepository.getAllEndPointsData();
      print('---------');
      print('------${endPointsData}---------');
      print(endPointsData);
      setState(() {
        _endPointsData = endPointsData;
      });
    } on SocketException catch (_) {
      // TODO
      //print(e);
      showAlertDialog(
          context: context,
          title: 'Connection Error',
          content: "Could Not get Data",
          defaultActionText: 'Ok');
    }
    catch (_){
      showAlertDialog(
          context: context,
          title: 'Unknown Error',
          content: "Please contact support on try again later",
          defaultActionText: 'Ok');
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedDateFormatter(
      lastUpdated: _endPointsData != null ? _endPointsData!.values[EndPoint.cases]!.date : null,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            LastUpdatedStatusText(
              text: formatter.lastUpdatedStatusText(),
            ),
            for (var endpoint in EndPoint.values)
              EndpointCard(
                endPoint: endpoint,
                value: _endPointsData != null ? _endPointsData!.values[endpoint]!.value : null,
              ),
          ],
        ),
      ),
    );
  }
}
