import 'dart:collection';

import '../model/form.dart';


class FeedbackCache {

  // SplayTreeMap cache = new SplayTreeMap<String, FeedbackForm>();
  SplayTreeMap<String,FeedbackForm> cache;
  FeedbackCache(this.cache);
}