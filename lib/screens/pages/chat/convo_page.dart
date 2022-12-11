import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taxi_user/services/cloud_function/add_message.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class ConvoPage extends StatefulWidget {
  @override
  State<ConvoPage> createState() => _ConvoPageState();
}

class _ConvoPageState extends State<ConvoPage> {
  final _messageController = TextEditingController();

  final box = GetStorage();

  final messageController = TextEditingController();

  late String myName = '';

  getData1() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          myName = data['firstName'] + ' ' + data['lastName'];
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData1();
  }

  showToast() {
    Fluttertoast.showToast(
        msg: "Message is empty",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  late String profilePicOfPersonToSend, nameOfPersonToSend;

  @override
  Widget build(BuildContext context) {
    print(box.read('uid'));
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser!.uid)
            .doc(box.read('uid'))
            .collection('Messages')
            .orderBy('dateTime')
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
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              foregroundColor: Colors.black,
              centerTitle: true,
              backgroundColor: Colors.grey[300],
              title: TextBold(
                  text: data.docs[0]['nameOfPersonToSend'],
                  fontSize: 22,
                  color: Colors.black),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        itemCount: snapshot.data?.size ?? 0,
                        itemBuilder: (context, index) {
                          nameOfPersonToSend =
                              data.docs[index]['nameOfPersonToSend'];
                          profilePicOfPersonToSend =
                              data.docs[index]['profilePicOfPersonToSend'];
                          return data.docs[index]['nameOfPersonToSend'] !=
                                  myName
                              ? Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      120, 10, 10, 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          SingleChildScrollView(
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 15, 10, 15),
                                                child: TextRegular(
                                                    text: data.docs[index]
                                                        ['message'],
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              width: 220,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: TextRegular(
                                            text: data.docs[index]['time'],
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 50, 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          SingleChildScrollView(
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 15, 10, 15),
                                                child: TextRegular(
                                                    text: data.docs[index]
                                                        ['message'],
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              width: 220,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 250),
                                        child: TextRegular(
                                            text: data.docs[index]['time'],
                                            fontSize: 12,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: ColoredBox(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: _messageController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (_messageController.text == '') {
                                showToast();
                              } else {
                                addMessage(
                                    profilePicOfPersonToSend,
                                    nameOfPersonToSend,
                                    _messageController.text,
                                    box.read('uid'),
                                    myName);
                                addMessage1(
                                    profilePicOfPersonToSend,
                                    nameOfPersonToSend,
                                    _messageController.text,
                                    box.read('uid'),
                                    myName);

                                _messageController.clear();
                              }
                            },
                            icon: const Icon(Icons.send, color: Colors.blue),
                          ),
                          hintText: 'Type your message. .',
                          hintStyle: const TextStyle(
                            fontFamily: 'QRegular',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
