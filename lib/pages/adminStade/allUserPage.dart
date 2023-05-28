import 'package:flutter/material.dart';

import '../../utils/consts.dart';
import 'drawer.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({super.key});

  @override
  State<AllUserPage> createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
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
                  "All Users",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  itemCount: Constants.users.length,
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
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(Constants.users[index].name,),
                          subtitle: Text(Constants.users[index].email),
                          trailing: Text(Constants.users[index].role.name),
                          )
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
