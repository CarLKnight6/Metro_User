import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Ride History', Colors.grey[300]!),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
                          child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    icon: Icons.person,
                                    label: 'Rate Driver',
                                    flex: 2,
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    icon: Icons.person,
                                    label: 'Rate Driver',
                                    flex: 2,
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                      minRadius: 30,
                                      maxRadius: 30,
                                      backgroundColor: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextRegular(
                                        text: '4.5 ★',
                                        fontSize: 12,
                                        color: Colors.black),
                                  ],
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextRegular(
                                        text: 'Drivers Name: John Doe',
                                        fontSize: 14,
                                        color: Colors.black),
                                    TextRegular(
                                        text: '09090104355',
                                        fontSize: 12,
                                        color: Colors.grey),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextRegular(
                                        text:
                                            'Pickup Location: Current Location',
                                        fontSize: 12,
                                        color: Colors.black),
                                    TextRegular(
                                        text:
                                            'Destination Location: Cagayan De Oro City',
                                        fontSize: 12,
                                        color: Colors.black),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextRegular(
                                            text: 'Fare:',
                                            fontSize: 14,
                                            color: Colors.grey),
                                        TextBold(
                                            text: '200.00php',
                                            fontSize: 18,
                                            color: Colors.black),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                tileColor: Colors.white,
                              )),
                        );
                      }),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
