import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quran/quran.dart' as quran;
import 'package:verses/colors.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Mirza'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget getVerse() {
    final randomSurah = Random();
    int surahNumber = randomSurah.nextInt(115);
    final randomVerse = Random();
    int verseNumber = randomVerse.nextInt(
      quran.getVerseCount(surahNumber),
    );

    String verse = quran.getVerse(surahNumber, verseNumber);
    return Text(
      verse + quran.getVerseEndSymbol(verseNumber),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 28,
        color: color1,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color1,
          elevation: 10,
          title: const Text(
            "الرئيسية",
            style: TextStyle(color: color2, fontSize: 30),
          ),
          actions: const [Icon(Icons.menu_rounded)],
          iconTheme: const IconThemeData(color: color2, size: 30),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: const BoxDecoration(
                  color: color3,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                height: 300,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: getVerse(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
