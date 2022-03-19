import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'data_repositories.dart';

class EndPointsData {
  EndPointsData({required this.values});

  final Map<EndPoint, int> values;

  int get cases => values[EndPoint.cases]!;

  int get casesSuspected => values[EndPoint.casesSuspected]!;

  int get casesConfirmed => values[EndPoint.casesConfirmed]!;

  int get deaths => values[EndPoint.deaths]!;

  int get recovered => values[EndPoint.recovered]!;

  @override
  String toString() =>
      'cases: $cases , suspected: $casesSuspected ,confirmed:$casesConfirmed, deaths: $deaths, '
      'recovered: $recovered';
}
