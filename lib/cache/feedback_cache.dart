import 'dart:collection';

import '../model/form.dart';


class FeedbackCache {

  SplayTreeMap cache = new SplayTreeMap<String, FeedbackForm>();

  FeedbackCache(this.cache);
}