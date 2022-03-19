import 'package:coronavirus_rest_api_flutter_course/app/repositories/data_repositories.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/ui/endpoint_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int? _cases;

  @override
  initState(){
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final cases = await dataRepository.getEndPointData(EndPoint.cases);
    print('---------');
    print('------${cases}---------');
    print(cases);

    setState(() {
      _cases = cases;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            EndpointCard(endPoint: EndPoint.cases, value: _cases),
          ],
        ),
      ),
    );
  }
}
