// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Note`
  String get homeRoot {
    return Intl.message('Note', name: 'homeRoot', desc: '', args: []);
  }

  /// `Newest First`
  String get newestOrderLabel {
    return Intl.message(
      'Newest First',
      name: 'newestOrderLabel',
      desc: '',
      args: [],
    );
  }

  /// `Oldest First`
  String get oldestOrderLabel {
    return Intl.message(
      'Oldest First',
      name: 'oldestOrderLabel',
      desc: '',
      args: [],
    );
  }

  /// `A → Z`
  String get azLabel {
    return Intl.message('A → Z', name: 'azLabel', desc: '', args: []);
  }

  /// `Z → A`
  String get zaKey {
    return Intl.message('Z → A', name: 'zaKey', desc: '', args: []);
  }

  /// `Search ...`
  String get searchBoxLabel {
    return Intl.message(
      'Search ...',
      name: 'searchBoxLabel',
      desc: '',
      args: [],
    );
  }

  /// `No Notes Found`
  String get notFoundSearchNoteLabel {
    return Intl.message(
      'No Notes Found',
      name: 'notFoundSearchNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Try searching with another word`
  String get notFoundSearchNoteMessage {
    return Intl.message(
      'Try searching with another word',
      name: 'notFoundSearchNoteMessage',
      desc: '',
      args: [],
    );
  }

  /// `No Notes Yet`
  String get notCreateNoteLabel {
    return Intl.message(
      'No Notes Yet',
      name: 'notCreateNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create your first note`
  String get notCreateNoteMessage {
    return Intl.message(
      'Create your first note',
      name: 'notCreateNoteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this note?`
  String get deleteMessage {
    return Intl.message(
      'Are you sure you want to delete this note?',
      name: 'deleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButtonLabel {
    return Intl.message(
      'Cancel',
      name: 'cancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteButoonLabel {
    return Intl.message(
      'Delete',
      name: 'deleteButoonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Pinned`
  String get pinnedHomeLabel {
    return Intl.message('Pinned', name: 'pinnedHomeLabel', desc: '', args: []);
  }

  /// `Others`
  String get othersHomeLabel {
    return Intl.message('Others', name: 'othersHomeLabel', desc: '', args: []);
  }

  /// `Title`
  String get titleLabel {
    return Intl.message('Title', name: 'titleLabel', desc: '', args: []);
  }

  /// `Type Something ...`
  String get contentLabel {
    return Intl.message(
      'Type Something ...',
      name: 'contentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get addNoteButtonLabel {
    return Intl.message(
      'Add Note',
      name: 'addNoteButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get snakBarMessage {
    return Intl.message(
      'Please fill all fields',
      name: 'snakBarMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unpin Note`
  String get unpinNoteLabel {
    return Intl.message(
      'Unpin Note',
      name: 'unpinNoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Pin Note`
  String get pinNoteLabel {
    return Intl.message('Pin Note', name: 'pinNoteLabel', desc: '', args: []);
  }

  /// `Settings`
  String get settingsRoot {
    return Intl.message('Settings', name: 'settingsRoot', desc: '', args: []);
  }

  /// `Language`
  String get languageLabel {
    return Intl.message('Language', name: 'languageLabel', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightModeLabel {
    return Intl.message(
      'Light Mode',
      name: 'lightModeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Language:`
  String get selectLanguageLabel {
    return Intl.message(
      'Select Language:',
      name: 'selectLanguageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChangesButton {
    return Intl.message(
      'Save Changes',
      name: 'saveChangesButton',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabicLanguageSelect {
    return Intl.message(
      'Arabic',
      name: 'arabicLanguageSelect',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishLanguageSelect {
    return Intl.message(
      'English',
      name: 'englishLanguageSelect',
      desc: '',
      args: [],
    );
  }

  /// `Français`
  String get FranceLanguageSelect {
    return Intl.message(
      'Français',
      name: 'FranceLanguageSelect',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
