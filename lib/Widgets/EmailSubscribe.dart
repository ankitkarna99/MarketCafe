import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market_cafe/Http/dio.dart';
import 'package:market_cafe/Screens/SuccessScreen.dart';

class EmailSubscribe extends StatefulWidget {
  @override
  _EmailSubscribeState createState() => _EmailSubscribeState();
}

class _EmailSubscribeState extends State<EmailSubscribe> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 4),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.mail,
                      size: 36,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Subscribe",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                  "Subscribe to our latest offers and updates (including coupons and discounts)."),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.7)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.7)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.7)),
                  ),
                  hintText: "Your Email",
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 48,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(
                    "Subscribe",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Dio dio = DioMod().getInstance();
                    try {
                      Response response = await dio.post("/subscription",
                          data: {"email": emailController.text});
                      emailController.text = "";
                      print(response);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessScreen(
                                    message: response.data["message"],
                                  )));
                    } catch (err) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Check your input fields and verify for valid email."),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
