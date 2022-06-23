import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeController extends GetxController {
  static TimeController instance = Get.find();
  var time = DateFormat('kk:mm').format(DateTime.now()).obs;
  var day = DateFormat('EEE').format(DateTime.now()).obs;
  var date = DateFormat.yMMMMd('en_US').format(DateTime.now()).obs;
  String gettimeNow() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      time.value = DateFormat('kk:mm').format(DateTime.now());
      return gettimeNow();
    });
    return time.value;
  }

  String getdayNow() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      day.value = DateFormat('EEE').format(DateTime.now());
      return getdayNow();
    });
    return day.value;
  }

  String getDateNow() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      date.value = DateFormat.yMMMMd('en_US').format(DateTime.now());
      return getDateNow();
    });
    return date.value;
  }
}
