import 'package:rxdart/rxdart.dart';

class NoticeSchema {
  final String title, description;

  NoticeSchema({this.title, this.description});
}

class Notices {
  BehaviorSubject<List<NoticeSchema>> _notices = BehaviorSubject.seeded([]);

  Observable get stream$ => _notices.stream;

  List<NoticeSchema> get current => _notices.value;

  setNotices(List<NoticeSchema> notices) {
    _notices.add(notices);
  }
}
