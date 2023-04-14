import 'package:flutter/material.dart';
import 'package:eokul2/anasayfa.dart';
import 'package:eokul2/ayarlar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        items: [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}

class Ogrdetay extends StatefulWidget {

  const Ogrdetay({Key? key}) : super(key: key);

  @override
  State<Ogrdetay> createState() => _OgrdetayState();

}

class _OgrdetayState extends State<Ogrdetay> {
  @override
  final List<Widget> _tabItems = [AnaSayfa(), Ayarlar()];
  int _activePage = 0;
  Widget build(BuildContext context) {
    List<dynamic>? data = [];
    String ogrAdi,ogrSifre;

    data = ModalRoute.of(context)?.settings.arguments as List?;
    ogrAdi = data![0];
    ogrSifre= data[1];
    final _pageController = PageController();
    return Scaffold(
      appBar: AppBar(title: Text('Hoşgeldin '+ogrAdi+"!")),
      /*body: _tabItems[_activePage],*/
      body: Center(child: Image.asset('../assets/ogr_orn.png',width: 350,height: 250,)),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index){
          setState(() {
            _activePage = index;
          });
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.favorite)
        ],
      ),
    );
  }
}
