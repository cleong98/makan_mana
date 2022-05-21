import 'package:makan_mana/service/setting_entry.dart';

class Singleton {
  //lazy load
  static late final Singleton _instance = Singleton._internal();

  //private constructor
  Singleton._internal();

  //factory
  factory Singleton() => _instance;

  SettingEntry? _settingEntry;

  SettingEntry? get settingEntry => _settingEntry;

  bool get settingEntryIsNull => _settingEntry == null;

  set setSettingEntry(SettingEntry settingEntry) {
    _settingEntry ??= settingEntry;
  }

}