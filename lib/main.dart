import 'dart:io';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:makan_mana/generated/l10n.dart';
import 'package:makan_mana/service/setting_entry.dart';
import 'package:makan_mana/service/singleton.dart';
import 'package:makan_mana/utils/phone_state.dart';

void main() {
  runApp(PhoneState(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Locale get _effectiveLocale {
    Locale? locale = Singleton().settingEntry?.locale;

    if (locale != null) {
      return locale;
    }

    final String languageCode = Intl.shortLocale(Platform.localeName);
    return MmAppLocalisation.delegate.supportedLocales.firstWhereOrNull(
            (Locale locale) => locale.languageCode == languageCode) ??
        MmAppLocalisation.delegate.supportedLocales.first;
    // final List<String> localeNameSplit = Platform.localeName.split('_');
    // if (localeNameSplit.length == 1) {
    //   return Locale.fromSubtags(
    //     languageCode: localeNameSplit[0],
    //   );
    // } else if (localeNameSplit.length == 2) {
    //   return Locale.fromSubtags(
    //       languageCode: localeNameSplit[0],
    //       scriptCode: localeNameSplit[1]
    //   );
    // } else {
    //   return Locale.fromSubtags(
    //     languageCode: localeNameSplit[0],
    //     scriptCode: localeNameSplit[1],
    //     countryCode: localeNameSplit[2],
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {

    // print(Platform.localeName);
    // print(Intl.shortLocale(Platform.localeName));
    return MaterialApp(
      title: 'Makan Mana',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MmAppLocalisation.delegate,
      ],
      locale: _effectiveLocale,
      supportedLocales: MmAppLocalisation.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Makan Mana Homepage'),
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
  @override
  void initState() {
    super.initState();
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
            children: [
              Text(
                MmAppLocalisation.of(context).appTitle,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  if(Singleton().settingEntryIsNull) {
                    Singleton().setSettingEntry = SettingEntry();
                  }

                  Singleton().settingEntry?.locale = const Locale.fromSubtags(languageCode: 'zh');
                  PhoneState.rebuild(context);
                  // final settingEntry = Singleton().settingEntry;
                  // if(settingEntry != null) {
                  //   Singleton().settingEntry?.locale = const Locale.fromSubtags(languageCode: 'zh');
                  //
                  // }
                },
                child: const Text(
                  "change simplified chinese",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
  }
}
