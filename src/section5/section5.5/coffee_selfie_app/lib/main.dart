import 'package:coffee_selfie_app/redux/actions/actions.dart';
import 'package:coffee_selfie_app/redux/models/app_state.dart';
import 'package:coffee_selfie_app/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:coffee_selfie_app/redux/reducers/app_state_reducer.dart';
import 'package:coffee_selfie_app/redux/middleware/middleware.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final _store = Store<AppState>(
    appStateReducer,
    initialState: AppState(),
    middleware: [middleware],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Coffee Selfie App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => Home(
            onInit: () {
              StoreProvider.of<AppState>(context).dispatch(LoadThumbsAction());
            },
          ),
        },
      ),
    );
  }
}

