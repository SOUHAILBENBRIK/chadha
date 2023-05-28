import 'package:flutter/material.dart';

import 'drawer.dart';

class DemandeEquipe extends StatefulWidget {
  const DemandeEquipe({super.key});

  @override
  State<DemandeEquipe> createState() => _DemandeEquipeState();
}

class _DemandeEquipeState extends State<DemandeEquipe> {
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
                  "Les  Demmande De Reservation  ",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: 8,
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
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Vous Avez Une Demande De reservation Pour le  ${DateTime.now().day} /${DateTime.now().month}",
                                style: TextStyle(
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
