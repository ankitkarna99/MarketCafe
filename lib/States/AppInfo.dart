import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class AppInfo {
  BehaviorSubject<Map<String, String>> _appInfo = BehaviorSubject.seeded({
    "MapURL":
        "https://www.google.com/maps/search/?api=1&query=37.6667067,-77.5751198,17z",
    "PickupURL": "https://holo.harbortouch.com/en/order/marketcafe/",
    "DeliveryURL": "https://postmates.com/merchant/market-cafe-glen-allen",
    "ContactNumber": "(804)-934-0144",
    "Address": "10950 Nuckols Rd Glen Allen, VA 23060",
    "SUNDAY": "9:30 AM to 11:00 PM",
    "MONDAY": "11:00 AM to 11:00 PM",
    "TUESDAY": "11:00 AM to 11:00 PM",
    "WEDNESDAY": "11:00 AM to 11:00 PM",
    "THURSDAY": "11:00 AM to 11:00 PM",
    "FRIDAY": "11:00 AM to 11:00 PM",
    "SATURDAY": "9:30 AM to 11:00 PM"
  });

  Observable get stream$ => _appInfo.stream;

  Map<String, String> get current => _appInfo.value;

  setInfo(Map<String, String> info) {
    _appInfo.add(info);
  }
}
