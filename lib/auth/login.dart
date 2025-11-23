import 'package:flutter/material.dart';
import 'package:flutter_application_6/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errormessage;
  late bool isError;

  @override
  void initState(){
    errormessage = "This is an error message";
    isError = false;
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  void checkLogin (username, password){
    setState((){
      if (username == ""){
        errormessage = "Please enter your username!";
      }
      else if (password == ""){
        errormessage = "Please enter your password!";
        isError = true;
      }else{
        errormessage = "";
        isError = false;
      }
      
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/facebook-logo.png',
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 12,),
                  Text("FACEBOOK", style: txtStyle,),
                ],
              ),
              SizedBox(height: 15,),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person_rounded),
                ),
              ),
              const SizedBox(height: 15,),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_rounded),
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.blue, 
                ),
                onPressed: (){
                  checkLogin(usernameController.text, passwordController.text);
                  if (!isError){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> SocialMedia()),
                    );
                  }
                },
                child: Text('LOGIN', style: txtStyle2),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
}

var txtStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var registerTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var errorTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 14,
);

var txtStyle2 = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 24,
  color: Colors.white,
);