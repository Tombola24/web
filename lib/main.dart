import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_header_drawer.dart';
import 'login.dart';
import 'Calculator.dart';
import 'signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBcgEjDA_JFluidSynthJpQMy4X1FSpadNRI0",
          appId: "1:803395298600:android:691bc5d100ab75b4781c1d",
          messagingSenderId: "803395298600",
          projectId: "mobile-programming-92ebb"));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        textTheme: GoogleFonts.robotoMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        textTheme: GoogleFonts.robotoMonoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      themeMode: _themeMode,
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const SignUp(),
        '/calculator': (context) => const CalculatorScreen(),
      },
      home: HomePage(
        onThemeChanged: _toggleTheme,
        themeMode: _themeMode,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  final ThemeMode themeMode;

  const HomePage({Key? key, required this.onThemeChanged, required this.themeMode}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.login;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.themeMode == ThemeMode.dark;
  }

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          currentPage = DrawerSections.login;
          break;
        case 1:
          currentPage = DrawerSections.signup;
          break;
        case 2:
          currentPage = DrawerSections.calculator;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget container;
    AppBar appBar;

    switch (currentPage) {
      case DrawerSections.signup:
        container = const SignUp();
        appBar = AppBar(
          title: const Text("Sign Up"),
          backgroundColor: Colors.blue,
        );
        break;
      case DrawerSections.calculator:
        container = const CalculatorScreen();
        appBar = AppBar(
          title: const Text("Calculator"),
          backgroundColor: Colors.blue,
        );
        break;
      case DrawerSections.login:
      default:
        container = const Login();
        appBar = AppBar(
          title: const Text("Login"),
          backgroundColor: Colors.blue,
        );
        break;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: const Text(
              'MY APP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: container,
        drawer: Drawer(
          child: Container(
            color: _isDarkMode ? Colors.grey[800] : Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: const [Colors.blue, Colors.blueAccent],
                    ),
                  ),
                  child: const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  leading: Icon(Icons.account_circle, color: _isDarkMode ? Colors.white : Colors.black),
                  title: Text('Sign In', style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black, fontSize: 20)),
                  onTap: () {
                    Navigator.pop(context);
                    _onItemTapped(0);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  leading: Icon(Icons.account_circle, color: _isDarkMode ? Colors.white : Colors.black),
                  title: Text('Sign Up', style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black, fontSize: 20)),
                  onTap: () {
                    Navigator.pop(context);
                    _onItemTapped(1);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  leading: Icon(Icons.calculate, color: _isDarkMode ? Colors.white : Colors.black),
                  title: Text('Calculator', style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black, fontSize: 20)),
                  onTap: () {
                    Navigator.pop(context);
                    _onItemTapped(2);
                  },
                ),
                ListTile(
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _isDarkMode = value;
                        widget.onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  login,
  signup,
  calculator,
}
