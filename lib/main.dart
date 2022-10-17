import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()=> runApp(MaterialApp(
  home: loginapp(),
  debugShowCheckedModeBanner: false,
));

class loginapp extends StatefulWidget {
  const loginapp({Key? key}) : super(key: key);

  @override
  State<loginapp> createState() => _loginappState();
}

class _loginappState extends State<loginapp> with SingleTickerProviderStateMixin{
  AnimationController? iconanimationcontroller;
  Animation<double>? iconanimation;
  void initState(){
    super.initState();
    iconanimationcontroller=new AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    iconanimation=new CurvedAnimation(parent: iconanimationcontroller!, curve: Curves.bounceInOut);
    iconanimation!.addListener(()=> this.setState(() {}));
    iconanimationcontroller!.forward();

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(image: AssetImage('assets/img_2.png'),
              fit: BoxFit.cover,
            color: Colors.black26,
            colorBlendMode:BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: iconanimationcontroller!.value*120,
              ),
              Form(
                  child: Theme(
                    data: ThemeData(brightness: Brightness.dark,primarySwatch: Colors.green,
                        inputDecorationTheme:InputDecorationTheme(labelStyle: TextStyle(fontSize: 20,color: Colors.white70))),
                    child: Container(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter your email",

                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          Padding(padding: EdgeInsets.only(top: 40)),
                          MaterialButton(
                            height: 40,
                            minWidth: 100,
                            color: Colors.green,
                              child: Text("Login"),
                              splashColor: Colors.white24,
                              onPressed: () {})
                        ],
                      ),
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}


