import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';




class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({Key? key}) : super(key: key);

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    String monthName = DateFormat('MMMM').format(today);
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerManPage(),
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Text(
              "Aujourd'hui",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "$monthName / ${today.year}",
              style: TextStyle(color: Colors.black),
            ),
            Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: dates()),
                bloc1(text: "8 AM", text1: "equipe x",color: Colors.orangeAccent),
                bloc1(text: "9 AM", text1: "-----------",color: Colors.greenAccent),
                bloc1(text: "10 AM", text1: "equipe y",color: Colors.yellowAccent),
                bloc1(text: "11 AM", text1: "equipe z",color: Colors.amberAccent),
          ]),
        ));
  }

  Widget bloc1({required String text,required String text1,required Color color}) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(children: [
        Text(text), 
        SizedBox(width: 20,),
      Text(text1)]),
    );
  }

  SingleChildScrollView dates() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        children: List.generate(
          lastDayOfMonth.day,
          (index) {
            final currentDate = lastDayOfMonth.add(Duration(days: index + 1));
            final dayName = DateFormat('E').format(currentDate);
            return Padding(
              padding:
                  EdgeInsets.only(left: index == 0 ? 16.0 : 0.0, right: 16.0),
              child: GestureDetector(
                onTap: () => setState(() {
                  selectedIndex = index;
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 42.0,
                      width: 42.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Colors.green
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(44.0),
                      ),
                      child: Text(
                        dayName.substring(0, 1),
                        style: TextStyle(
                          fontSize: 24.0,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "${index + 1}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 2.0,
                      width: 28.0,
                      color: selectedIndex == index
                          ? Colors.green
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
