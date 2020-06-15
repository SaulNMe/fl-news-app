import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) => navegacionModel.paginaActual = index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Para ti')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados')),
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Container(
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(seconds: 1), curve: Curves.bounceOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}