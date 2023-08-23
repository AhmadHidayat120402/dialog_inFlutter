import 'package:dialog_in_flutter/shared/util/dialog/dialog_hendler.dart';
import 'package:dialog_in_flutter/shared/util/loading/loading_hendler.dart';
import 'package:flutter/material.dart';
import 'package:dialog_in_flutter/core.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    bool confirm = false;
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Confirm'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(
                                    'Are you sure you want to delete this item?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[600],
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              onPressed: () {
                                confirm = true;
                                Navigator.pop(context);
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );

                    // print("confirm : $confirm");
                    if (confirm) {
                      print("Confirmed!");
                    }
                  },
                  child: const Text("Dialog"),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height - 100),
                      content: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.developer_board,
                            size: 24.0,
                          ),
                          Expanded(
                            child: Text('Hello Tiktok'),
                          )
                        ],
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text("Snackbar"),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text("bottomSheet"),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () async {
                    LoadingHendler.showLoading(context);
                    await Future.delayed(const Duration(seconds: 2));
                    LoadingHendler.hideLoading(BuildContext, context);
                    DialogHendler.showMessage(context, "thanks dayat");
                  },
                  child: const Text("More"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
