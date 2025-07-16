import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String endpointUrl = 'https://c705b56da8d1.ngrok-free.app';

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
