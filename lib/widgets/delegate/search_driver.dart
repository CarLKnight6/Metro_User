import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:taxi_user/screens/pages/chat/message_page.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';

import 'package:taxi_user/widgets/text/text_regular.dart';

import '../../services/cloud_function/add_message.dart';

class SearchMessages extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        onPressed: () {
          if (query != '') {
            close(context, null);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('No Input. Cannot Procceed'),
              ),
            );
          }
        },
        icon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final box = GetStorage();

    String tdata = DateFormat("hh").format(DateTime.now());

    final msgController = TextEditingController();

    print(tdata);

    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();

    // TODO: implement buildSuggestions
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Drivers')
            .where('name',
                isGreaterThanOrEqualTo: toBeginningOfSentenceCase(query))
            .where('name', isLessThan: '${toBeginningOfSentenceCase(query)}z')
            .where('isActive', isEqualTo: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              itemBuilder: (context, index) {
                return Consumer(
                  builder: ((context, ref, child) {
                    return ListTile(
                      onTap: () {
                        box.write('uid', data.docs[index].id);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MessagePage()));

                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 2.5, 10, 10),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              minRadius: 25,
                                              maxRadius: 25,
                                              backgroundImage: NetworkImage(
                                                  data.docs[index]
                                                      ['profile_picture']),
                                              backgroundColor: Colors.black,
                                            ),
                                            title: TextBold(
                                                text: data.docs[index]['name'],
                                                fontSize: 18,
                                                color: Colors.black),
                                            subtitle: TextBold(
                                                text: data.docs[index]
                                                        ['vehicle_model'] +
                                                    ' - ' +
                                                    data.docs[index]
                                                        ['plate_number'],
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              StreamBuilder<DocumentSnapshot>(
                                                  stream: userData,
                                                  builder: (context,
                                                      AsyncSnapshot<
                                                              DocumentSnapshot>
                                                          snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return const Center(
                                                          child:
                                                              Text('Loading'));
                                                    } else if (snapshot
                                                        .hasError) {
                                                      return const Center(
                                                          child: Text(
                                                              'Something went wrong'));
                                                    } else if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                    dynamic data1 =
                                                        snapshot.data;
                                                    return SizedBox(
                                                      width: 220,
                                                      height: 50,
                                                      child: TextFormField(
                                                        controller:
                                                            msgController,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                'Quicksand'),
                                                        decoration:
                                                            InputDecoration(
                                                          suffixIcon:
                                                              IconButton(
                                                            onPressed: () {
                                                              addMessage(
                                                                  data.docs[
                                                                          index][
                                                                      'profile_picture'],
                                                                  data.docs[
                                                                          index]
                                                                      ['name'],
                                                                  msgController
                                                                      .text,
                                                                  data
                                                                      .docs[
                                                                          index]
                                                                      .id,
                                                                  data1['firstName'] +
                                                                      ' ' +
                                                                      data1[
                                                                          'lastName']);
                                                              addMessage1(
                                                                  data.docs[
                                                                          index][
                                                                      'profile_picture'],
                                                                  data.docs[
                                                                          index]
                                                                      ['name'],
                                                                  msgController
                                                                      .text,
                                                                  data
                                                                      .docs[
                                                                          index]
                                                                      .id,
                                                                  data1['firstName'] +
                                                                      ' ' +
                                                                      data1[
                                                                          'lastName']);

                                                              msgController
                                                                  .clear();

                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            icon: const Icon(
                                                                Icons.send),
                                                          ),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons.chat_rounded,
                                                            color: Colors.grey,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          filled: true,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          hintText:
                                                              'Chat with ${data.docs[index]['name']}',
                                                          hintStyle:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'QRegular',
                                                            color: Colors.grey,
                                                            fontSize: 12.0,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      subtitle: TextRegular(
                          text: data.docs[index]['vehicle_model'] +
                              ' - ' +
                              data.docs[index]['plate_number'],
                          fontSize: 10,
                          color: Colors.grey),
                      title: TextRegular(
                          text: data.docs[index]['name'],
                          fontSize: 12,
                          color: Colors.black),
                      trailing: const Icon(Icons.arrow_right),
                      tileColor: Colors.white,
                      leading: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          minRadius: 25,
                          maxRadius: 25,
                          backgroundColor: Colors.green[900],
                          backgroundImage:
                              NetworkImage(data.docs[index]['profile_picture']),
                        ),
                      ),
                    );
                  }),
                );
              });
        });
  }
}
