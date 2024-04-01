// home: MainPage(state) changed to home: child (so MainPage doesn't get rebuilt)
// edit: it still does get rebuilt because CoreState is mutable (unlike with ValueNotifiers)

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/core_state.dart';
import 'page/color_page.dart';
import 'page/counter_page.dart';
import 'widget/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'ChangeNotifier';

  @override
  Widget build(BuildContext context) {
    final state = CoreState();
    return ListenableBuilder(
        listenable: state,
        child: MainPage(state),
        builder: (BuildContext context, Widget? child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: title,
              theme: ThemeData(
                scaffoldBackgroundColor: state.backgroundColor,
                primaryColor: Colors.white,
              ),
              home: child,
            ));
  }
}

class MainPage extends StatelessWidget {
  const MainPage(
    this.state, {
    super.key,
  });

  final CoreState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
                listenable: state,
                builder: (BuildContext context, Widget? child) => Text(
                      '${state.counter}',
                      style: const TextStyle(fontSize: 100),
                    )),
            const SizedBox(height: 47),
            ButtonWidget(
              text: 'Change Color',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ColorPage(state),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Change Counter',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CounterPage(state),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
