import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperClass{
  static void saveHigestScoreToSharedPref(int higest,String tag) async {
    var now = DateTime.now();
    var formatter = DateFormat('MMM-dd / h:mm');
    String formattedDate = formatter.format(now);

    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(tag, higest);
    // sharedPreferences.setString("minDt", formattedDate);
  }

 static Future<int> fetchHigestScoreFromSharedPref(String tag) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(tag)!;
  }
}

