import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
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
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('User History')
                  .where('userId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .orderBy('dateTime')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: snapshot.data?.size ?? 0,
                      itemBuilder: ((context, index) {
                        DateTime created =
                            data.docs[index]['dateTime'].toDate();

                        String formattedTime =
                            DateFormat.yMMMd().add_jm().format(created);
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
                                    icon: Icons.star,
                                    label: 'Rate Driver',
                                    flex: 2,
                                  ),
                                ],
                              ),
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      Share.share(
                                          'My Ride\nDriver: ${data.docs[index]['driverName']}\nContact Number: ${data.docs[index]['driverContactNumber']}\nDestination: ${data.docs[index]['destinationLocation']}\nDate: ${data.docs[index]['dateTime']}');
                                    },
                                    backgroundColor: Colors.amber,
                                    foregroundColor: Colors.white,
                                    icon: Icons.share,
                                    label: 'Share',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) {
                                      FirebaseFirestore.instance
                                          .collection('User History')
                                          .doc(data.docs[index].id)
                                          .delete();
                                    },
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextBold(
                                        text: formattedTime,
                                        fontSize: 12,
                                        color: Colors.black),
                                    ListTile(
                                      leading: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          CircleAvatar(
                                            minRadius: 30,
                                            maxRadius: 30,
                                            backgroundColor: Colors.black,
                                          ),
                                        ],
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextRegular(
                                              text:
                                                  'Drivers Name: ${data.docs[index]['driverName']}',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: data.docs[index]
                                                  ['driverContactNumber'],
                                              fontSize: 12,
                                              color: Colors.grey),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextRegular(
                                              text:
                                                  'Pickup Location: ${data.docs[index]['pickupLocation']}',
                                              fontSize: 12,
                                              color: Colors.black),
                                          TextRegular(
                                              text:
                                                  'Destination Location: ${data.docs[index]['destinationLocation']}',
                                              fontSize: 12,
                                              color: Colors.black),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextRegular(
                                                  text: 'Fare:',
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                              TextBold(
                                                  text:
                                                      '${data.docs[index]['payment']}php',
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
                                    ),
                                  ],
                                ),
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
