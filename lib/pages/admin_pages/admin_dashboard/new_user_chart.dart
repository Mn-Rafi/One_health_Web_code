import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/pages/admin_pages/admin_dashboard/daily_income_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NewUsersData extends StatelessWidget {
  // final List<SubscriberSeries> data;

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  NewUsersData({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(2010, 35),
      SalesData(2011, 28),
      SalesData(2012, 34),
      SalesData(2013, 32),
      SalesData(2014, 40)
    ];
    return Container(
      height: 400,
      width: 500,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Appointment status",
                style: mainHeaderStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SfCartesianChart(
                    primaryXAxis: NumericAxis(),
                    series: <ChartSeries>[
                      // Renders line chart
                      LineSeries<SalesData, double>(
                          dataSource: chartData,
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ]),
                //  SfCircularChart(
                //     legend: Legend(
                //         textStyle: normalTextStyle,
                //         isVisible: true,
                //         overflowMode: LegendItemOverflowMode.scroll),
                //     tooltipBehavior: _tooltipBehavior,
                //     series: <CircularSeries>[
                //       PieSeries<SubscriberSeries, String>(
                //         explode: true,
                //         dataSource: data,
                //         xValueMapper: (SubscriberSeries data, _) => data.year,
                //         yValueMapper: (SubscriberSeries data, _) =>
                //             data.subscribers,
                //         dataLabelSettings: DataLabelSettings(
                //             textStyle: normalTextStyle,
                //             showZeroValue: false,
                //             isVisible: true,
                //             labelPosition: ChartDataLabelPosition.outside),
                //         enableTooltip: true,
                //       )
                //     ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// @override
// Widget build(BuildContext context) {

//   return Scaffold(
//       body: Center(
//           child: Container(
//               child: )));
// }

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
