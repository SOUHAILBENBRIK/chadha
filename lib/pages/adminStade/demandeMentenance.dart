import 'package:flutter/material.dart';

import 'drawer.dart';

class DemandeMantenance extends StatefulWidget {
  const DemandeMantenance({super.key});

  @override
  State<DemandeMantenance> createState() => _DemandeMantenanceState();
}

class _DemandeMantenanceState extends State<DemandeMantenance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: const DrawerAdminPage(),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3.75, top: 25),
                child: const Text(
                  "Les  Demmande De Maintenances ",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 10, right: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Row(children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.25,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Vous Avez Une Demande De Maintenance Pour le ${DateTime.now().day} /${DateTime.now().month} ",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.block,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
