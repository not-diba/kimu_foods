import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:io';

// String url =
String endpointUrl = Platform.isAndroid ? 'http://10.0.2.2:4000/' : 'http://localhost:4000/';


class EndPoint {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(
      GraphQLClient(
        link: HttpLink(endpointUrl, defaultHeaders: {}),
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return _client;
  }
}