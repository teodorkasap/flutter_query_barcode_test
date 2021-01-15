import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbxeMUiLBCi4zr8nnmCrnaf4WkAO7yq0qZm2yaQiPPubbeOe4PXDA_V5JQ/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http.post(URL, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  /// Async function which loads feedback from endpoint URL and returns List.
  Future<List<FeedbackForm>> getFeedbackList(String barcode) async {
    var queryParameters = {'barcode': barcode};
    var uri = Uri.https(
        "script.google.com",
        "/macros/s/AKfycbxeMUiLBCi4zr8nnmCrnaf4WkAO7yq0qZm2yaQiPPubbeOe4PXDA_V5JQ/exec",
        queryParameters);
    return await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    }).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }

  Future<List<FeedbackForm>> getJsonData(String barcode) async {
    var queryParameters = {'barcode': barcode};
    var uri = Uri.https(
        "script.google.com",
        "/macros/s/AKfycbxeMUiLBCi4zr8nnmCrnaf4WkAO7yq0qZm2yaQiPPubbeOe4PXDA_V5JQ/exec",
        queryParameters);
    var response = await http.get(
        // encode url
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        });
    print("response headers below:");
    print(response.headers);
    print("response body below:");
    print(response.body);
    print("the whole response below:");
    print(response);
    var convertedResponseToJson = convert.jsonDecode(response.body) as List;
    return convertedResponseToJson
        .map((json) => FeedbackForm.fromJson(json))
        .toList();
  }
}
