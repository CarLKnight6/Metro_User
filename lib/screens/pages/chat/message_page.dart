import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_user/screens/pages/chat/convo_page.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/delegate/search_driver.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../../widgets/drawer/drawer_widget.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Messages', Colors.grey[200]!),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(FirebaseAuth.instance.currentUser!.uid)
              .orderBy('dateTime', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('error');
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
            return ListView.builder(
              itemCount: snapshot.data?.size ?? 0,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            FirebaseFirestore.instance
                                .collection(
                                    FirebaseAuth.instance.currentUser!.uid)
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
                    child: ListTile(
                      onTap: () {
                        box.write('uid', data.docs[index].id);
                        box.write('name', data.docs[index].id);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConvoPage()));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.white,
                      title: Text(
                        data.docs[index]['message'],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'QBold'),
                      ),
                      subtitle: TextRegular(
                          text: 'Last message from: ' +
                              data.docs[index]['myName'],
                          fontSize: 12,
                          color: Colors.grey),
                      trailing: TextRegular(
                          text: data.docs[index]['time'],
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                );
              }),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showSearch(
              context: context,
              delegate: SearchMessages(),
            );
          }),
    );
  }
}
