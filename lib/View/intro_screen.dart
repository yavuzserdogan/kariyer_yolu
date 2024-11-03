import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_egitim/View/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _introData = [
    {
      "title": "Hoş Geldiniz",
      "description": "Kariyer planlamanı henüz yapmadın mı? Şimdi başla!",
      "image": "images/giris.png",
    },
    {
      "title": "Kariyer Testi",
      "description": "Kendi ilgi alanlarına uygun mesleği belirlemek için kariyer testini çöz!",
      "image": "images/test.png",
    },
    {
      "title": "Meslek Bilgilendirme",
      "description": "Geleceğin meslekleri hakkında bilgi edin ve bugünden hazırlık yap!",
      "image": "images/info.png",
    },
    {
      "title": "Başarı ve Gelişim",
      "description": "Başarılarını ve kişisel gelişimini adım adım takip et!",
      "image": "images/basari.png",
    },
    {
      "title": "Hedef Belirleme",
      "description": "Hedeflerini belirle ve yol haritanı keşfet!",
      "image": "images/hedef.png",
    },
    {
      "title": "Günlük Motivasyon",
      "description": "Günlük motivasyon ile her gün daha güçlü hisset!",
      "image": "images/bildirim.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    final padding = mediaWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _introData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Container(
                      width: mediaWidth * 0.8,
                      height: mediaHeight * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_introData[index]['image']!),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white70.withOpacity(0.6),
                            spreadRadius: 13,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),
                    Text(
                      _introData[index]['title']!,
                      style: TextStyle(
                        fontSize: mediaHeight * 0.04,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 2.0,
                        fontFamily: 'Georgia',
                        color: Colors.black,
                        //backgroundColor: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: mediaHeight * 0.03),
                    Text(
                      _introData[index]['description']!,
                      style: TextStyle(
                        fontSize: mediaHeight * 0.022,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Arial',
                        color: Colors.grey.shade100,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: mediaHeight * 0.05,
            left: padding,
            right: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        opaque: true,
                        duration: const Duration(milliseconds: 500),
                        child: const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Atla",
                    style: TextStyle(
                      fontSize: mediaHeight * 0.024,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Georgia',
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    _introData.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: mediaWidth * 0.01),
                      width: _currentIndex == index ? mediaWidth * 0.03 : mediaWidth * 0.02,
                      height: _currentIndex == index ? mediaWidth * 0.03 : mediaWidth * 0.02,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index ? Colors.greenAccent : Colors.white70,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentIndex == _introData.length - 1) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          opaque: true,
                          duration: const Duration(milliseconds: 500),
                          child: const LoginScreen(),
                        ),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    _currentIndex == _introData.length - 1 ? "Başla" : "İleri",
                    style: TextStyle(
                      fontSize: mediaHeight * 0.024,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Georgia',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
