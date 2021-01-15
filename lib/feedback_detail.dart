import 'package:flutter/material.dart';

import 'model/form.dart';

class FeedbackDetailView extends StatelessWidget {
  final FeedbackForm feedbackForm;

  FeedbackDetailView(this.feedbackForm);




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Product Details'),
        ),
        body: new ListView(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(32.0),
                child: new Row(
                  children: [
                    // First child in the Row for the name and the
                    // Release date information.
                    new Expanded(
                      // Name and Release date are in the same column
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Code to create the view for name.
                          new Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: new Text(
                              "Name: ${feedbackForm.name}",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Code to create the view for release date.
                          new Text(
                            "EAN: ${feedbackForm.barcodeNo}",
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          new Text(
                            "email: ${feedbackForm.email}",
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          new Text(
                            "Desc: ${feedbackForm.feedback}",
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Icon to indicate the rating.

                  ],
                ),
              )
            ]
        )
    );
  }


}
