import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';

import 'package:taxi_user/services/locations/place_service.dart';
import 'package:taxi_user/services/providers/destination_provider.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  final sessionToken;
  late PlaceApiProvider apiClient;

  final box = GetStorage();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();

    showToast() {
      Fluttertoast.showToast(
          msg: "Invalid. Place is not set!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return FutureBuilder(
        future: query == ""
            ? null
            : apiClient.fetchSuggestions(
                query, Localizations.localeOf(context).languageCode),
        builder: (context, AsyncSnapshot<List> snapshot) {
          return query == ''
              ? StreamBuilder<DocumentSnapshot>(
                  stream: userData,
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text('Loading'));
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Something went wrong'));
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    dynamic data = snapshot.data;
                    return Consumer(
                      builder: ((context, ref, child) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () async {
                                if (data['homeLat'] == 0) {
                                  showToast();
                                } else {
                                  Navigator.of(context).pop();

                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          data['homeLat'], data['homeLong']);
                                  print(placemarks);
                                  Placemark place = placemarks[0];

                                  ref.read(destinationProvider.notifier).state =
                                      '${place.street}, ${place.locality} ';

                                  print('${place.street}, ${place.locality} ');
                                }
                              },
                              leading: TextRegular(
                                  text: 'Home',
                                  fontSize: 14,
                                  color: Colors.black),
                              trailing: const Icon(Icons.home),
                            ),
                            ListTile(
                              onTap: () async {
                                if (data['officeLat'] == 0) {
                                  showToast();
                                } else {
                                  Navigator.of(context).pop();

                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          data['officeLat'],
                                          data['officeLong']);
                                  print(placemarks);
                                  Placemark place = placemarks[0];

                                  ref.read(destinationProvider.notifier).state =
                                      '${place.street}, ${place.locality} ';

                                  print('${place.street}, ${place.locality} ');
                                }
                              },
                              leading: TextRegular(
                                  text: 'Workplace',
                                  fontSize: 14,
                                  color: Colors.black),
                              trailing: const Icon(Icons.work_outline),
                            ),
                            ListTile(
                              onTap: () async {
                                if (data['schoolLat'] == 0) {
                                  showToast();
                                } else {
                                  Navigator.of(context).pop();

                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          data['schoolLat'],
                                          data['schoolLong']);
                                  print(placemarks);
                                  Placemark place = placemarks[0];

                                  ref.read(destinationProvider.notifier).state =
                                      '${place.street}, ${place.locality} ';

                                  print('${place.street}, ${place.locality} ');
                                }
                              },
                              leading: TextRegular(
                                  text: 'School',
                                  fontSize: 14,
                                  color: Colors.black),
                              trailing: const Icon(Icons.school_outlined),
                            ),
                          ],
                        );
                      }),
                    );
                  })
              : snapshot.hasData
                  ? Consumer(
                      builder: ((context, ref, child) {
                        return ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                            title: Text((snapshot.data![index] as Suggestion)
                                .description),
                            onTap: () {
                              close(
                                  context, snapshot.data![index] as Suggestion);

                              ref.read(destinationProvider.notifier).state =
                                  (snapshot.data![index] as Suggestion)
                                      .description;
                            },
                          ),
                          itemCount: snapshot.data!.length,
                        );
                      }),
                    )
                  : const Center(child: Text('Loading...'));
        });
  }
}
