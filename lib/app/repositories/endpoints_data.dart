import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';

import '../services/endpoint_data.dart';

class EndPointsData {
  EndPointsData({required this.values});

  final Map<EndPoint, EndpointData> values;

  EndpointData get cases => values[EndPoint.cases]!;

  EndpointData get casesSuspected => values[EndPoint.casesSuspected]!;

  EndpointData get casesConfirmed => values[EndPoint.casesConfirmed]!;

  EndpointData get deaths => values[EndPoint.deaths]!;

  EndpointData get recovered => values[EndPoint.recovered]!;

  @override
  String toString() =>
      'cases: $cases , suspected: $casesSuspected ,confirmed:$casesConfirmed, deaths: $deaths, '
      'recovered: $recovered';
}
