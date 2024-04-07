import 'dart:ui';

import 'package:get/get.dart';

class Local extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LocalStrings.english: "English",
          LocalStrings.hindi:"हिंदी",
          LocalStrings.punjabi:'ਪੰਜਾਬੀ',
          LocalStrings.urdu:'اردو',
          'hello': "Swaan",
          'work': "EXECUTIVE PAD",
          'button': "Language",
          'name': "English"
        },
        'hi_IN': {
          LocalStrings.english: "English",
          LocalStrings.hindi:"हिंदी",
          LocalStrings.punjabi:'ਪੰਜਾਬੀ',
          LocalStrings.urdu:'اردو',
          'hello': "स्वैन",
          'work': "कार्यकारी पैड",
          'button': "भाषा",
          'name': "हिंदी"
        },
        'punj_IN': {
         LocalStrings.english: "English",
          LocalStrings.hindi:"हिंदी",
          LocalStrings.punjabi:'ਪੰਜਾਬੀ',
          LocalStrings.urdu:'اردو',

          'hello': "ਹੰਸ",
          'work': "ਕਾਰਜਕਾਰੀ ਪੈਡ",
          'button': "ਭਾਸ਼ਾ",
          'name': "ਪੰਜਾਬੀ"
        },

    'ur_IN': {
      LocalStrings.english: "English",
      LocalStrings.hindi:"हिंदी",
      LocalStrings.punjabi:'ਪੰਜਾਬੀ',
      LocalStrings.urdu:'اردو',

      'hello': "سوان",
      'work': "ایگزیکٹو پیڈ",
      'button': "",
      'name': "اردو"
    },





      };
}
class AppLocals{
  static Locale punjabi = Locale('punj', 'IN');
  static Locale hindi = Locale('hi', 'IN');
  static Locale english = Locale('en', 'US');
  static Locale Urdu = Locale('ur', 'IN');
}

class LocalStrings{
  static String english = "english";
  static String hindi = "hindi";
  static String punjabi = "punjabi";
  static String urdu="urdu";
}