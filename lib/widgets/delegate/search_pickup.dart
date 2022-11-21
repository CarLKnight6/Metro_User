import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import 'package:taxi_user/services/locations/place_service.dart';
import 'package:taxi_user/services/providers/destination_provider.dart';

class PickupSearch extends SearchDelegate<Suggestion> {
  PickupSearch(this.sessionToken) {
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
    return FutureBuilder(
        future: query == ""
            ? null
            : apiClient.fetchSuggestions(
                query, Localizations.localeOf(context).languageCode),
        builder: (context, AsyncSnapshot<List> snapshot) {
          return query == ''
              ? Container(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Search for Location'),
                )
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

                              ref.read(pickupProvider.notifier).state =
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
