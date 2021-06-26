import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'welcome admin',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Container> daftarMenuMcd = new List();

  var menu = [
    {"nama": "Singapore", "gambar": "1.jpg", "like": "12"},
    {"nama": "Kuala Lumpur", "gambar": "2.jpg", "like": "10"},
  ];
  _buatlist() async {
    for (var i = 0; i < menu.length; i++) {
      final menubts = menu[i];
      final String gambar = menubts["gambar"];

      daftarMenuMcd.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: menubts['nama'],
                    child: new Material(
                      child: new InkWell(
                          onTap: () =>
                              Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new Detail(
                                  nama: menubts['nama'],
                                  gambar: gambar,
                                  like: menubts['like'],
                                ),
                              )),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0)),
                            child: new Image.asset(
                              "img/$gambar",
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                  ),
                  new Text(
                    menubts['nama'],
                    style: new TextStyle(fontSize: 14.0),
                  )
                ],
              ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Row(
        children: [
          Text(
            "Get Ur Great Hotel",
            style: new TextStyle(color: Colors.white),
          ),
        ],
      )),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarMenuMcd,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar, this.like});
  final String nama;
  final String gambar;
  final String like;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
            like: like,
          ),
          new BarisIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama, this.like});
  final String nama;
  final String like;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style:
                      new TextStyle(fontSize: 20.0, color: Color(0xFF955AD1)),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.yellow,
              ),
              new Text(
                like,
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BarisIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.airline_seat_flat,
            teks: "Check In",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "See More",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Color(0xFF955AD1),
          ),
          SizedBox(height: 12.0),
          new Text(
            teks,
            style: new TextStyle(fontSize: 14.0, color: Color(0xFF955AD1)),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
