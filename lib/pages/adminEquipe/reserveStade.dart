import 'package:flutter/material.dart';

import 'drawer.dart';
import 'mesReservations.dart';

class ReserveStadePage extends StatefulWidget {
  const ReserveStadePage({super.key});

  @override
  State<ReserveStadePage> createState() => _ReserveStadePageState();
}

class _ReserveStadePageState extends State<ReserveStadePage> {
  late final DateTime _selectedDateStart = DateTime.now();
  late final DateTime _selectedDateFin = DateTime.now();
  TextEditingController startDate = TextEditingController();
  TextEditingController finDate = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController status = TextEditingController();

  Future<void> _selectDate(BuildContext context,
      {required DateTime date, required int index}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        switch (index) {
          case 1:
            startDate.text = "${date.day}/${date.month}/${date.year}";
            break;
          default:
            finDate.text = "${date.day}/${date.month}/${date.year}";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: DrawerEquipePage(),
        appBar: AppBar(
          actions: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Image.asset("assets/images/logo.png"),
                radius: 25,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin:
                EdgeInsets.symmetric(vertical: height * 0.08, horizontal: 5),
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Reserver un evenement ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              TextFormField(
                                readOnly: true,
                                controller: startDate,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(111, 37, 37, 37),
                                  label: Text(
                                    "Date Debut",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 20,
                                top: 8,
                                child: IconButton(
                                  onPressed: () {
                                    _selectDate(context,
                                        date: _selectedDateStart, index: 1);
                                    debugPrint(
                                        "date selected:  + $_selectDate");
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              TextFormField(
                                readOnly: true,
                                controller: finDate,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(111, 37, 37, 37),
                                  label: Text(
                                    "Date Fin ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 20,
                                top: 8,
                                child: IconButton(
                                  onPressed: () {
                                    _selectDate(context,
                                        date: _selectedDateFin, index: 2);
                                    debugPrint(
                                        "date selected:  + $_selectDate");
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: type,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(111, 37, 37, 37),
                              label: Text(
                                "Type de reservation ..",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: status,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(111, 37, 37, 37),
                              label: Text(
                                "Status",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) {
                                return const MesReservationsPage();
                              }));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 15,
                              width: MediaQuery.of(context).size.width - 60,
                              decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "reserver",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
