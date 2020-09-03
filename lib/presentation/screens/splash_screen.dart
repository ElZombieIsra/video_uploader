import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_uploader/presentation/components/loader.dart';
import 'package:video_uploader/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String error;

  Future<dynamic> initApp() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      await Firebase.initializeApp();
      Navigator.pushReplacementNamed(
        context,
        RoutesNames.home,
      );
    } catch (e) {
      setState(() => error = e.toString());
    }
  }

  @override
  void initState() {
    /// Se asegura que los widgets se hayan cargado antes de ejecutar initApp();
    WidgetsBinding.instance.addPostFrameCallback((_) => initApp());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: error == null
              ? CircularLoader()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Ocurrió un error al obtener los datos. Error: $error.",
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ),
    );
  }
}
