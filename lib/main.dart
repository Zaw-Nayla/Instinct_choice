import 'package:flutter/material.dart';
import 'package:storyline/story.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stortyline mystory = Stortyline();

  int choicenumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/japanese-temple.webp'),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 65.h,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      mystory.getstoryTitle(),
                      style: TextStyle(
                        fontFamily: 'Edu',
                        fontSize: 20.sp,
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom:20.0),
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple),
                        onPressed: () {
                          setState(() {
                            mystory.getnextStory(1);
                            mystory.getstoryTitle();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            mystory.getChoice1(),
                            style: TextStyle(
                             fontFamily: 'Libre',
                             fontSize : 8.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                    visible: mystory.buttonShouldBeVisible(),
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                                          primary: Colors.deepPurple),
                        onPressed: () {
                          setState(() {
                            mystory.getnextStory(2);
                            mystory.getstoryTitle();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            mystory.getChoice2(),
                            style: TextStyle(
                             fontFamily: 'Libre',
                             fontSize : 8.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
