import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key? key, required this.endPoint, this.value}) : super(key: key);
  final EndPoint endPoint;
  final int? value;

  static Map<EndPoint, String> _cardTitles = {
    EndPoint.cases: 'Cases',
    EndPoint.casesSuspected: 'Suspected cases',
    EndPoint.casesConfirmed: 'Confirmed case',
    EndPoint.deaths: 'Deaths',
    EndPoint.recovered: 'Recovered',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_cardTitles[endPoint]!, style: Theme.of(context).textTheme.headline6),
              Text(
                value != null ? value.toString() : '',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
