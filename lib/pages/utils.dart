// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'dart:math';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

List<String> names = [
  "Match",
  "Maintenance",
  "Match",
];
List<String> time = ["8:00 am", "9:00 am", "10 am", "11 am", "12 am"];

Random random = Random();

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents1 = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode1,
)..addAll(_kEventSource1);

final _kEventSource1 = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
        item % 4 + 1,
        (index) => Event('${time[index]} : ${names[random.nextInt(2)]}'))
}..addAll({
    kToday: [
      Event('${time[0]} : ${names[0]} '),
      Event('${time[1]} : ${names[1]} '),
      Event('${time[2]} : ${names[1]} '),
    ],
  });

int getHashCode1(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kEvents2 = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode2,
)..addAll(_kEventSource2);

final _kEventSource2 = {
  for (var item in List.generate(40, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 4): List.generate(
        item % 3 + 1,
        (index) => Event('${time[index]} : ${names[random.nextInt(2)]}'))
}..addAll({
    kToday: [
      Event('${time[0]} : ${names[0]} '),
      Event('${time[2]} : ${names[2]} '),
      Event('${time[3]} : ${names[1]} '),
    ],
  });

int getHashCode2(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kEvents3 = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode3,
)..addAll(_kEventSource3);

final _kEventSource3 = {
  for (var item in List.generate(60, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 6): List.generate(
        item % 5 + 1,
        (index) => Event('${time[index]} : ${names[random.nextInt(2)]}'))
}..addAll({
    kToday: [
      Event('${time[0]} : ${names[1]} '),
      Event('${time[1]} : ${names[1]} '),
      Event('${time[2]} : ${names[1]} '),
    ],
  });
int getHashCode3(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 5, kToday.day);
