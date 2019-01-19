import 'package:flutter/material.dart';


void main() => runApp(new UiLogin());//instance uilogin

class UiLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Loginpage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),

    );
  }
}

class Loginpage extends StatefulWidget {
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> with SingleTickerProviderStateMixin{
  AnimationController _iconanimationController;
  Animation<double> _iconanimation;

  @override
  void initState(){
    super.initState();
    _iconanimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds:500 )
    );
    _iconanimation = new CurvedAnimation(
      parent: _iconanimationController,
      curve: Curves.easeInOut
    );
    _iconanimation.addListener(()=> this.setState((){}));
    _iconanimationController.forward();

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image:new AssetImage("assets/dna.jpg"),
            fit:BoxFit.cover ,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            new FlutterLogo(
              size: _iconanimation.value * 100,
            ),
            new Form(
              child: Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme:new InputDecorationTheme(labelStyle: new TextStyle(
                    color: Colors.tealAccent,fontSize: 20.0
                  ))
                ),
                              child: Container(
                                padding: const EdgeInsets.all(40.0),
                                                              child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "enter email",
                      ),
                      
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "enter password",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    new MaterialButton(
                      color: Colors.teal,
                      child: new Text("LOGIN",style: new TextStyle(color: Colors.deepPurple),),
                      onPressed: ()=>{},
                      splashColor: Colors.greenAccent,
                    )
                  ],
                ),
                              ),
              ),
              
            )
          ],)

        ],
      ),
    );
  }
}
