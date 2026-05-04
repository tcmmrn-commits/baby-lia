import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentSettingsController extends ChangeNotifier {
  static const _musicEnabledKey = 'settings_music_enabled';
  static const _voiceEnabledKey = 'settings_voice_enabled';
  static const _showTextPromptsKey = 'settings_show_text_prompts';
  static const _sessionLengthKey = 'settings_session_length';

  bool _musicEnabled = true;
  bool _voiceEnabled = true;
  bool _showTextPrompts = true;
  int _sessionLengthMinutes = 10;

  bool get musicEnabled => _musicEnabled;
  bool get voiceEnabled => _voiceEnabled;
  bool get showTextPrompts => _showTextPrompts;
  int get sessionLengthMinutes => _sessionLengthMinutes;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _musicEnabled = prefs.getBool(_musicEnabledKey) ?? true;
    _voiceEnabled = prefs.getBool(_voiceEnabledKey) ?? true;
    _showTextPrompts = prefs.getBool(_showTextPromptsKey) ?? true;
    _sessionLengthMinutes = prefs.getInt(_sessionLengthKey) ?? 10;
    notifyListeners();
  }

  void setMusicEnabled(bool value) {
    _musicEnabled = value;
    _save();
    notifyListeners();
  }

  void setVoiceEnabled(bool value) {
    _voiceEnabled = value;
    _save();
    notifyListeners();
  }

  void setShowTextPrompts(bool value) {
    _showTextPrompts = value;
    _save();
    notifyListeners();
  }

  void setSessionLengthMinutes(int value) {
    _sessionLengthMinutes = value.clamp(5, 20);
    _save();
    notifyListeners();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_musicEnabledKey, _musicEnabled);
    await prefs.setBool(_voiceEnabledKey, _voiceEnabled);
    await prefs.setBool(_showTextPromptsKey, _showTextPrompts);
    await prefs.setInt(_sessionLengthKey, _sessionLengthMinutes);
  }
}
