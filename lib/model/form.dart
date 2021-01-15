/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String name;
  String email;
  String barcodeNo;
  String feedback;

  FeedbackForm(
      this.name,
      this.email,
      this.barcodeNo,
      this.feedback
  );
  FeedbackForm.onlyFromBarcode(String barcodeNo) : this("","",barcodeNo,"");

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}","${json['email']}","${json['barcodeNo']}","${json['feedback']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'email': email,
    'barcodeNo': barcodeNo,
    'feedback': feedback
  };
}