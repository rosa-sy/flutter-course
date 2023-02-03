import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyHomePage(
      title: "",
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        canvasColor: Colors.white,
      ),
      darkTheme:
          ThemeData(primaryColor: Colors.indigo, canvasColor: Colors.black),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String str = "Flutter Demo";
  List imgList = [
    'images/art1.png',
    'images/art2.png',
    'images/art3.png',
    'images/art4.png'
  ];
  int _radioval = 0;
  String result = "";
  bool js = false;
  bool cSharp = false;
  bool python = false;
  late Color resultcolor;
  ThemeMode tm = ThemeMode.light;
  bool swval = false;

  String get txt {
    String str = "You Selected :\n";
    if (js == true) str += "Javascript\n";
    if (cSharp == true) str += "C#\n";
    if (python == true)
      str += "Python\n";
    else
      str += "None\n";
    return str;
  }

  String _selectedletter = " _";
  List letterList = ['A', 'B', 'C', 'D'];
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  fetchImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(image.path);
    });
  }

  void changeColor(Color color) => setState(() {
        currentColor = color;
      });
  Color currentColor = Colors.teal;
  List<Color> _defaultColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
  ];
  double _value = 0.0;
  final li = List<String>.generate(20, (index) => "item num ${index + 1}");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: tm,
        theme: ThemeData(
          primaryColor: Colors.indigo,
          canvasColor: Colors.white,
        ),
        darkTheme:
            ThemeData(primaryColor: Colors.indigo, canvasColor: Colors.grey),
        home: Scaffold(
            appBar: AppBar(
                leading: Padding(
                    padding: EdgeInsets.only(left: 1),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.account_box),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.account_tree_outlined)))
                      ],
                    )),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.account_box),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.account_tree_outlined))
                ],
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.deepPurpleAccent,
                    Colors.cyanAccent,
                    Colors.deepPurpleAccent
                  ])),
                ),
                title: Text(str),
                // bottom: TabBar(
                //   tabs: <Widget>[
                //     Tab(text: 'HSV'),
                //     Tab(text: 'Material'),
                //     Tab(text: 'Block')
                //   ],
                // ),
                centerTitle: true),
            body: perecentList()));
  }

  ListView perecentList() {
    return ListView(
            children: [
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 10.0,
                percent: 0.8,
                header: Text("Icon header"),
                center:
                    Icon(Icons.person_pin, size: 50.0, color: Colors.blue),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),
              //attached with slider....
              CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 700,
                lineWidth: 15.0,
                percent: _value,
                center: Text(
                  "40 hours",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
              Slider(
                value: _value,
                onChanged: (val) => setState(() => _value = val),
                min: 0.0,
                max: 1.0,
                divisions: 10,
              ),
              LinearPercentIndicator(
                width: 170.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                leading: new Text("left content"),
                trailing: new Text("right content"),
                percent: 0.2,
                center: Text("20.0%"),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Colors.red,
              ),
            ],
          );
  }

//..................................build marquee..............................
  ListView bMarquee() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 18,
        ),
        SizedBox(
            height: 70,
            child: Card(
              color: Colors.teal,
              child: Marquee(
                text: "Simple Marquee",
                blankSpace: 100,
                scrollAxis: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                pauseAfterRound: Duration(seconds: 6),
                accelerationDuration: Duration(microseconds: 50),
              ),
            )),
        SizedBox(
          height: 18,
        ),
        SizedBox(
            height: 70,
            child: Card(
              color: Colors.teal,
              child: Marquee(
                text: "Simple Marquee",
                blankSpace: 100,
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                pauseAfterRound: Duration(seconds: 3),
                accelerationDuration: Duration(microseconds: 500),
              ),
            )),
      ],
    );
  }

//..................................build list tile............................
  ListView bListTile() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ExpansionTile(
            backgroundColor: Colors.amber.shade100,
            leading: Icon(Icons.perm_identity),
            title: Text("Account "),
            children: [
              Divider(
                color: Colors.grey,
              ),
              Card(
                color: Colors.amberAccent.shade200,
                child: ListTile(
                  leading: Icon(Icons.add),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Sign Up "),
                  subtitle: Text("where you can register an account "),
                  onTap: showSnakBar,
                ),
              ),
              Card(
                color: Colors.amberAccent.shade200,
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Sign In "),
                  subtitle: Text("where you can register an account "),
                  onTap: showSnakBar,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ExpansionTile(
            backgroundColor: Color.fromARGB(255, 95, 91, 78),
            leading: Icon(Icons.message_outlined),
            title: Text("More info  "),
            children: [
              Divider(
                color: Colors.grey,
              ),
              Card(
                color: Colors.amber.shade100,
                child: ListTile(
                  leading: Icon(Icons.phone),
                  trailing: Icon(Icons.contact_page),
                  title: Text("contact"),
                  subtitle: Text("where you can call us "),
                  onTap: showSnakBar,
                ),
              ),
              Card(
                color: Colors.amber.shade100,
                child: ListTile(
                  leading: Icon(Icons.sign_language_sharp),
                  trailing: Icon(Icons.contact_page),
                  title: Text("Sign In "),
                  subtitle: Text("where you can register an account "),
                  onTap: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

//..................................build dropdown button......................
  Center buildDrobDownButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select A Letter!"),
          DropdownButton(
              value: _selectedletter,
              hint: Text(" Selected Letter"),
              items: letterList.map((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (nValu) {
                setState(() {
                  //_selectedletter = nValu ;
                });
              }),
        ],
      ),
    );
  }

//..................................build switch dark theme...................
  Center buildSwitch() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: Text("Light"),
          ),
          Switch(
            value: swval,
            onChanged: (bool value) {
              setState(() {
                swval = value;
                if (swval == false)
                  tm = ThemeMode.light;
                else
                  tm = ThemeMode.dark;
              });
            },
            activeColor: Colors.black,
            inactiveThumbColor: Colors.indigo,
          ),
          Padding(padding: EdgeInsets.all(40), child: Text("Dark")),
        ],
      ),
    );
  }

//..................................build check box...........................
  Padding buildCheckbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          //color: _radioval == 0 ? Colors.brown : Colors.green,

          child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                  value: js,
                  onChanged: (value) {
                    setState(() {
                      js = value!;
                    });
                  }),
              Text("js"),
            ],
          ),
          CheckboxListTile(
            value: cSharp,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                cSharp = value!;
              });
            },
            title: Text("Csharp"),
          ),
          Row(
            children: [
              Checkbox(
                value: python,
                onChanged: (value) {
                  setState(() {
                    python = value!;
                  });
                },
              ),
              Text("python"),
            ],
          )
          // buildRadioListTitle(0, "Brown", "chang gb to brown"),
          // buildRadioListTitle(1, "Green", "chang gb to green"),
          // buildRadioListTitle(2, "Red", "chang gb to red")
          ,
          ElevatedButton(
              onPressed: () {
                var ad = AlertDialog(
                  title: Text("Thank you for applying!"),
                  content: Text(txt),
                );
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return ad;
                    });
              },
              child: Text("Apply !"))
        ],
      )),
    );
  }

//..................................build Radio button...........................
  RadioListTile<dynamic> buildRadioListTitle(val, txt, subtxt) {
    return RadioListTile(
        value: val,
        groupValue: _radioval,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (value) {
          setState(() {
            _radioval = value;
          });
        },
        title: Text(txt),
        subtitle: Text(
          subtxt,
          style: TextStyle(color: Colors.white24),
        ));
  }

  Padding buildRaido() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "guass the answer : 2+2=? ",
            style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          buildRow(3),
          buildRow(4),
          buildRow(5),
        ],
      ),
    );
  }

//..................................build alert dialog...........................
  myDialog() {
    var ad = AlertDialog(
      content: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                "$result",
                style: TextStyle(color: resultcolor),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("answer is 4"),
              )
            ],
          )),
    );
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return ad;
        });
  }

  Row buildRow(int value) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: _radioval,
            onChanged: (value) {
              setState(() {
                _radioval = value!;
                result = value == 4 ? "correect Answer!" : "wrong Answer!";
                resultcolor = value == 4 ? Colors.green : Colors.red;
                myDialog();
              });
            }),
        Text("$value"),
      ],
    );
  }

//..................................build img slider...........................
  ListView buildSliderImg() {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Slider 1:Page Index 0\n\n",
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
            items: imgList.map((imageUrl) {
              return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(imageUrl, fit: BoxFit.fill));
            }).toList(),
            options: CarouselOptions(
              height: 186,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 3),
              enableInfiniteScroll: true,
            )),
        SizedBox(
          height: 20,
        ),
        Text(
          "Slider 1:Page Index 1\n\n",
          textAlign: TextAlign.center,
        ),
        CarouselSlider(
            items: imgList.map((imageUrl) {
              return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(imageUrl, fit: BoxFit.fill));
            }).toList(),
            options: CarouselOptions(
              height: 186,
              initialPage: 1,
            )),
        SizedBox(
          height: 20,
        ),
        Text(
          "Slider 2:Page Index 1\n\n",
          textAlign: TextAlign.center,
        ),
        CarouselSlider.builder(
          itemCount: imgList.length,
          itemBuilder: (_, index, realIndex) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(imgList[index], fit: BoxFit.fill),
            );
          },
          options: CarouselOptions(
            height: 186,
            initialPage: 1,
          ),
        ),
      ],
    );
  }

  Column someTextProperty(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Container(
          child: SelectableText(
            "I'm A copiable Text Select me And See What Gonna Happen !",
            showCursor: true,
            cursorColor: Colors.pinkAccent,
            cursorWidth: 10,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigoAccent,
              // backgroundColor: Colors.grey
            ),
            toolbarOptions: ToolbarOptions(
              copy: true,
              selectAll: true,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Center(
              child: ElevatedButton(
            child: Text(" Show simple FlushBar "),
            onPressed: () {
              buildFlashBar(context);
            },
          )),
        ),
        SizedBox(
          height: 15,
        ),
        //......................snakBar..........................
        Container(
          child: Center(
            child: ElevatedButton(
              child: Text("Click Me for snackbar!"),
              onPressed: () {
                setState(() {
                  str = "";
                });
                //alertDailog(context);
                SnackBar sBar = showSnakBar();
                ScaffoldMessenger.of(context).showSnackBar(sBar);
              },
            ),
          ),
        ),
        //......................alert dailog..........................
        SizedBox(
          height: 15,
        ),

        Container(
          child: Center(
            child: ElevatedButton(
              child: Text(
                "Click Me for alert dialog!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
              onPressed: () {
                alertDailog(context);
                // final sBar = SnackBar(
                //   content: Text("SnackBar Text"),
                //   duration: Duration(microseconds: 500),
                //   backgroundColor: Colors.deepPurple.shade400,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30)),
                // );
                // ScaffoldMessenger.of(context).showSnackBar(sBar);
              },
            ),
          ),
        ),
      ],
    );
  }

//..................................build flash bar...........................
  void buildFlashBar(BuildContext context) {
    Flushbar(
      duration: Duration(seconds: 8),
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: ElevatedButton(
          child: Text("Close ! "),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      icon: Icon(Icons.info, color: Colors.white),
      backgroundColor: Colors.amber,
      title: "This is The Title",
      // message: "This Is The Message",
      messageText: Text("This Is The Message",
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
    ).show(context);
  }

//..................................build snack bar ...........................
  SnackBar showSnakBar() {
    final sBar = SnackBar(
      action: SnackBarAction(
        textColor: Colors.black,
        label: "Undo!",
        onPressed: () {
          setState(() {
            str = 'Flutter Demo';
          });
        },
      ),
      content: Text("SnackBar Text"),
      duration: Duration(seconds: 8),
      backgroundColor: Colors.deepPurple.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
    return sBar;
  }

  void alertDailog(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      title: Text("Dialog Title"),
      content: Container(
          height: 150,
          child: Column(
            children: [
              Divider(color: Colors.black),
              Text("This is Dialog Text Outside  To Pop the dialog!"),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  //color: Colors.red,

                  child: Text("Close"),

                  onPressed: () {
                    Navigator.of(context).pop(" ");
                  },
                ),
              )
            ],
          )),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.indigoAccent.withOpacity(0.2),
        builder: (BuildContext ctx) {
          return alert;
        });
  }
}
