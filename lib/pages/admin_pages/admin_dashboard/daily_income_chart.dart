import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_appoinment_servies.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_dashboard_services.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/admin_appoinments_list_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AmountChart extends StatelessWidget {
  // final List<AmountandDateChartModel> data;

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  AmountChart({
    Key? key,
  }) : super(key: key);

  final AdminDashBoardServices _adminDashBoardServices =
      AdminDashBoardServices();
  final AdminAppoinmentServices _adminAppoinmentServices =
      AdminAppoinmentServices();

  @override
  Widget build(BuildContext context) {
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
                "Amount Per Day",
                style: mainHeaderStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder<List<AmountChartModelClass>?>(
                  future: _adminAppoinmentServices.getAllAppoinmentsforChart(
                      link: '/'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfCartesianChart(
                          primaryXAxis: CategoryAxis(visibleMaximum: 6),
                          primaryYAxis: NumericAxis(
                              minimum: 0, maximum: 2000, interval: 200),
                          tooltipBehavior: _tooltipBehavior,
                          series: <ChartSeries<AmountChartModelClass, String>>[
                            ColumnSeries<AmountChartModelClass, String>(
                                dataSource: snapshot.data!,
                                xValueMapper: (AmountChartModelClass data, _) =>
                                    data.date.substring(5,10),
                                yValueMapper: (AmountChartModelClass data, _) =>
                                    data.amount,
                                name: 'Income',
                                color: Color.fromRGBO(8, 142, 255, 1))
                          ]);
                    }
                    return Column(
                      children: const [
                        SizedBox(
                          height: 100,
                        ),
                        CircularProgressIndicator()
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
