import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_egitim/View/menu.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade500,
        title: Text(
          "Kariyer Yolu",
          style: TextStyle(
            fontSize: mediaHeight * 0.04,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: 'Georgia',
            letterSpacing: 1.5,
            wordSpacing: 3.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: mediaHeight * 0.06),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'images/logo.png',
                    height: mediaHeight * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: mediaHeight * 0.09),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Kullanıcı Adı',
                  hintStyle: TextStyle(
                    fontSize: mediaHeight * 0.02,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1.0,
                    fontFamily: 'Arial',
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.account_circle, color: Colors.black, size: 32.0),
                ),
              ),
              SizedBox(height: mediaHeight * 0.02),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Şifre',
                  hintStyle: TextStyle(
                    fontSize: mediaHeight * 0.02,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1.0,
                    fontFamily: 'Arial',
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.black, size: 32.0),
                ),
              ),
              SizedBox(height: mediaHeight * 0.25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      opaque: true,
                      duration: const Duration(milliseconds: 500),
                      child:  MenuPage(),
                    ),
                  );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.5,
                    MediaQuery.of(context).size.height * 0.06,
                  ),
                ),
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(
                    fontSize: mediaHeight * 0.025,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 2.0,
                    fontFamily: 'Georgia',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
