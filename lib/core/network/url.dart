import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String endpointUrl = 'https://e2ae-41-80-112-206.ngrok-free.app';

class EndPoint {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: HttpLink(endpointUrl, defaultHeaders: {}),
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return client;
  }
}
