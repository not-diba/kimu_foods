import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String endpointUrl = 'https://14c2-41-80-116-194.ngrok-free.app';

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
