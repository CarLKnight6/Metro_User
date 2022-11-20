import 'package:flutter/material.dart';

import 'package:taxi_user/services/locations/place_service.dart';

class AddressSearch extends SearchDelegate<Suggestion?> {
  AddressSearch(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  final sessionToken;
  late PlaceApiProvider apiClient;

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
        close(context, null);
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
                  ? ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                            (snapshot.data![index] as Suggestion).description),
                        onTap: () {
                          close(context, snapshot.data![index] as Suggestion);
                        },
                      ),
                      itemCount: snapshot.data!.length,
                    )
                  : Container(child: const Text('Loading...'));
        });
  }
}
