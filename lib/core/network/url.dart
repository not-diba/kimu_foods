import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String endpointUrl = 'https://fa9458a46e96.ngrok-free.app';

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
