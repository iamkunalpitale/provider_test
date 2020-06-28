
import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  String data = 'Some dummy data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}