/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String name;
  String email;
  String barcodeNo;
  String feedback;

  FeedbackForm(this.barcodeNo);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['barcodeNo']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'email': email,
    'barcodeNo': barcodeNo,
    'feedback': feedback
  };
}