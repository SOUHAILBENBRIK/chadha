import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:match_remainder/pages/Maintenance/drawer.dart';
import 'package:match_remainder/pages/adminStade/drawer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../utils/consts.dart';

class Stats extends StatefulWidget {
  const Stats({super.key, required this.index});
  final int index;

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Les statiques de maintenance "),
            ),
            drawer: widget.index == 0
                ? const DrawerAdminPage()
                : const DrawerManPage(),
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: Constants.stades.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width * 0.9,
                      margin: const EdgeInsets.all(7),
                      height: height * 0.3,
                      
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                      
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Text(Constants.stades[index].name,style: TextStyle(fontSize: 20,color: Colors.white),),
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: width*0.1),
                              child: LinearPercentIndicator(
                                                width: width*0.7,
                                                lineHeight: 8,
                                                percent: Constants.stades[index].percent/100,
                                                progressColor: Colors.greenAccent,
                                              ),
                            )
                          ]),
                    );
                  }),
            )));
  }
}
