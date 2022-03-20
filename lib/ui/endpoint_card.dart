import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);

  final String title;
  final String assetName;

  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key? key, required this.endPoint, this.value}) : super(key: key);
  final EndPoint endPoint;
  final int? value;

  static Map<EndPoint, EndpointCardData> _cardsData = {
    EndPoint.cases: EndpointCardData('Cases', 'assets/count.png', Color(0xFFFFF492)),
    EndPoint.casesSuspected:
        EndpointCardData('Suspected cases', 'assets/suspect.png', Color(0xFFEEDA28)),
    EndPoint.casesConfirmed:
        EndpointCardData('Confirmed cases', 'assets/fever.png', Color(0xFFE99600)),
    EndPoint.deaths: EndpointCardData('Deaths', 'assets/death.png', Color(0xFFE40000)),
    EndPoint.recovered: EndpointCardData('Recovered', 'assets/patient.png', Color(0xFF70A901)),
  };

  String get formattedValue{
    if(value == null){
      return '';
    }
    return NumberFormat('##,##,##,###').format(value);
  }


  @override
  Widget build(BuildContext context) {
    final cardData = _cardsData[endPoint];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardData!.title,
                style: Theme.of(context).textTheme.headline6!.copyWith(color: cardData.color),
              ),
              SizedBox(height: 6),
              SizedBox(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(cardData.assetName,color: cardData.color),
                    Text(
                      //value != null ? value.toString() : '',
                      formattedValue,
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: cardData.color),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
