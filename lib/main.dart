import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubankproducts/pages/home_page.dart';
import 'package:nubankproducts/utils/app_colors.dart';

import 'graphql/client.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GraphQLProvider(
      client: Client.graphqlClient,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.nubank,
          backgroundColor: AppColors.nubank,
          accentColor: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("NuConta Marketplace")),
          body: HomePage()
        ),
      ),
    );
  }
}


