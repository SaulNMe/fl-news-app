import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext ctx, int index) {
        return _Noticia(noticia: noticias[index], index: index);
      }
    );
  }
}


class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({Key key, @required this.noticia, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia, index: index,),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaNoticia(noticia: noticia),
        _TarjetaBotones(),
        SizedBox(height: 10,),
        Divider(),

      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RawMaterialButton(
            onPressed: () =>{},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: darkTheme.accentColor,
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: () =>{},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.blue[700],
            child: Icon(Icons.share),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: () =>{},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fillColor: Colors.grey,
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}

class _TarjetaNoticia extends StatelessWidget {

  final Article noticia;

  const _TarjetaNoticia({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null ) ? noticia.description : '', textAlign: TextAlign.left,),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen({this.noticia});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          child: (noticia.urlToImage != null) ?FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
            fit: BoxFit.cover,
          ) : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({ this.noticia });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({this.index, this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text("${ index + 1 } ", style: TextStyle(color:darkTheme.accentColor),),          
          Text("${ noticia.source.name }"),          
        ],
      ),
    );
  }
}