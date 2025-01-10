part of 'extension.dart';

extension BuildContextExt on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;

  ThemeTextStyles get textStyle => Theme.of(this).extension<ThemeTextStyles>()!;

  String tr(
    String key, {
    Map<String, String>? namedArgs,
  }) =>
      AppLocalizations.of(this).translate(key, namedArgs: namedArgs);
}

extension LocalizationExtension on String {
  String tr({
    BuildContext? context,
    Map<String, String>? namedArgs,
  }) =>
      context == null
          ? AppLocalizations.instance.translate(this, namedArgs: namedArgs)
          : AppLocalizations.of(context).translate(this, namedArgs: namedArgs);
}
