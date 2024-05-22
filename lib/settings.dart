import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tcc_deficiencia/Components/color.dart';
import 'package:tcc_deficiencia/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TTSConfigScreen extends StatefulWidget {
  const TTSConfigScreen({Key? key}) : super(key: key);

  @override
  _TTSConfigScreenState createState() => _TTSConfigScreenState();
}

class _TTSConfigScreenState extends State<TTSConfigScreen> {
  FlutterTts flutterTts = FlutterTts();

  double _speechRate = 1.0;
  double _volume = 1.0;
  double _pitch = 1.0;

  @override
  void initState() {
    super.initState();
    _loadConfigurations();
  }

  Future<void> _loadConfigurations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _speechRate = prefs.getDouble('speechRate') ?? 1.0;
      _volume = prefs.getDouble('volume') ?? 1.0;
      _pitch = prefs.getDouble('pitch') ?? 1.0;
      flutterTts.setSpeechRate(_speechRate);
      flutterTts.setVolume(_volume);
      flutterTts.setPitch(_pitch);
    });
  }

  Future<void> _saveConfigurations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('speechRate', _speechRate);
    await prefs.setDouble('volume', _volume);
    await prefs.setDouble('pitch', _pitch);
    flutterTts.setSpeechRate(_speechRate);
    flutterTts.setVolume(_volume);
    flutterTts.setPitch(_pitch);
  }

  void _incrementValue(String key) {
    setState(() {
      if (key == 'speechRate') {
        _speechRate += 0.1;
      } else if (key == 'volume') {
        _volume += 0.1;
      } else if (key == 'pitch') {
        _pitch += 0.1;
      }
    });
    flutterTts.speak('Testando configurações');
    _saveConfigurations();
  }

  void _decrementValue(String key) {
    setState(() {
      if (key == 'speechRate') {
        _speechRate -= 0.1;
      } else if (key == 'volume') {
        _volume -= 0.1;
      } else if (key == 'pitch') {
        _pitch -= 0.1;
      }
    });
    flutterTts.speak('Testando configurações');
    _saveConfigurations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações do Texto-para-Fala'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ajuste as configurações que te deixam mais confortável ao ouvir o texto-para-fala.',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            title: Text('Velocidade de fala'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decrementValue('speechRate'),
                ),
                Text(_speechRate.toStringAsFixed(1)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _incrementValue('speechRate'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Volume de voz'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decrementValue('volume'),
                ),
                Text(_volume.toStringAsFixed(1)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _incrementValue('volume'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Tom de voz'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decrementValue('pitch'),
                ),
                Text(_pitch.toStringAsFixed(1)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _incrementValue('pitch'),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primaryColor),
            width: MediaQuery.of(context).size.width * .9,
            height: 55,
            child: TextButton(
                onPressed: () async {
                  final pres = await SharedPreferences.getInstance();
                  pres.setBool("onboarding", true);

                  if (!mounted) return;
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: const Text(
                  "Finalizar",
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
