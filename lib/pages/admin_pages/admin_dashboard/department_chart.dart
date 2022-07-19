import 'package:flutter/material.dart';
import 'package:one_health_doctor_and_admin/api/admin_api/admin_dashboard_services.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DepartmentListChart extends StatelessWidget {
  // final List<SubscriberSeries> data;

  DepartmentListChart({
    Key? key,
  }) : super(key: key);

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  final AdminDashBoardServices _adminDashBoardServices =
      AdminDashBoardServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      padding: const EdgeInsets.all(20),
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
                child: FutureBuilder<List<AppointmentStatusChartModelData>?>(
                  future: _adminDashBoardServices.getAppointmentsChartData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfCircularChart(
                          legend: Legend(
                              textStyle: normalTextStyle,
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.scroll),
                          tooltipBehavior: _tooltipBehavior,
                          series: <CircularSeries>[
                            PieSeries<AppointmentStatusChartModelData, String>(
                              explode: true,
                              dataSource: snapshot.data,
                              xValueMapper: (data, _) => data.status,
                              yValueMapper: (data, _) => data.count,
                              dataLabelSettings: DataLabelSettings(
                                textStyle: normalTextStyle,
                                showZeroValue: false,
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              enableTooltip: true,
                            )
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
