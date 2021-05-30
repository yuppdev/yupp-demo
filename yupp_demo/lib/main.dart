import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yupp_demo/login_mail/auth.dart';
import 'package:yupp_demo/login_mail/authentication.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

// Login mail
// =====================================================
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
              home: ErrorWidget());
        } else if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: AuthService()),
              StreamProvider<User?>.value(
                  value: AuthService().user,
                  initialData: null,
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Authentication(),
            ),
          );
        } else {
          return MaterialApp(home: Loading());
        }
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text('Something went wrong!')],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

// Login phone
// =====================================================
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: InitializerWidget(),
//       home: PhoneLogin(),
//     );
//   }
// }
//
// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }
//
// class _InitializerWidgetState extends State<InitializerWidget> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? _user = FirebaseAuth.instance.currentUser;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser!;
//     isLoading = false;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(body: Center(child: CircularProgressIndicator()))
//         : _user == null ? PhoneLogin() : HomeScreen();
//   }
// }
