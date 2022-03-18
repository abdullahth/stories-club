import 'package:application/controllers/audios.dart';
import 'package:application/controllers/books.dart';
import 'package:application/controllers/users.dart';
import 'package:application/controllers/videos.dart';
import 'package:application/controllers/withdraw.dart';
import 'package:application/screens/main/main.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1500, 800);
    win.minSize = initialSize;
    win.size = initialSize;
    win.title = "Admin";
    win.show();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => BooksProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
        ChangeNotifierProvider(create: (_) => VideosProvider()),
        ChangeNotifierProvider(create: (_) => Withdraw()),
      ],
      child: MaterialApp(
        title: 'Admin - StoriesClub',
        theme: ThemeData(
            colorScheme: const ColorScheme(
              primary: Color(0xff00a96e),
              primaryVariant: Color(0xff00a96e),
              onPrimary: Color(0xFF),
              secondary: Color(0xFFcdcdcd),
              secondaryVariant: Color(0xFFa2a3a4),
              onSecondary: Color(0xFF),
              surface: Colors.transparent,
              onSurface: Color(0xFF),
              background: Colors.transparent,
              onBackground: Color(0xFF),
              error: Color(0xFFea0000),
              onError: Color(0xFF),
              brightness: Brightness.light,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00a96e)),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
            )),
        home: const MainPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
