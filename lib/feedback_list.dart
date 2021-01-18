import 'package:flutter/material.dart';
import 'package:flutter_query_barcode_test/cache/feedback_cache.dart';
import 'feedback_detail.dart';

import 'controller/form_controller.dart';
import 'model/form.dart';

class FeedbackListScreen extends StatelessWidget {
  final FeedbackForm feedbackForm;

  FeedbackListScreen({this.feedbackForm,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Feedback Responses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: "Responses", feedbackForm: feedbackForm));
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage({Key key, this.title, this.feedbackForm}) : super(key: key);
  final FeedbackForm feedbackForm;
  final String title;

  @override
  _FeedbackListPageState createState() =>
      _FeedbackListPageState(feedbackForm: feedbackForm);
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  final FeedbackForm feedbackForm;


  _FeedbackListPageState({this.feedbackForm});

  List<FeedbackForm> feedbackItems = List<FeedbackForm>();

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getJsonDataCache(feedbackForm.barcodeNo).then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.person),
                Expanded(
                  child: Text(
                      "${feedbackItems[index].name} (${feedbackItems[index]
                          .email})"),
                )
              ],
            ),
            subtitle: Row(
              children: <Widget>[
                Icon(Icons.message),
                Expanded(
                  child: Text(feedbackItems[index].feedback),
                )
              ],
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  FeedbackDetailView(feedbackItems[index])));
            },
          );
        },
      ),
    );
  }
}
