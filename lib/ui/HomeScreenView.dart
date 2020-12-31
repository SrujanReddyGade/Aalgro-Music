import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/HomeScreenBloc.dart';
import 'package:flutter_app/models/TopAlbums.dart';
import 'package:flutter_app/utils/AppContstants.dart';
import 'package:flutter/services.dart';

class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.appName,
        theme: ThemeData(
            primarySwatch: AppConstants.createMaterialColor(Color(0xFF2a2d36)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor:
                AppConstants.createMaterialColor(Color(0xFF2a2d36))),
        home: Scaffold(
          body: MyHomePage(),
        ),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Widget> images = new List<Widget>();

  Widget appBarTitle = new Text(
    "Top 100 albums",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(Icons.search, color: Colors.white);

  //final key = new GlobalKey<ScaffoldState>();
  final _searchQuery = new TextEditingController();
  String _searchText = "";
  List<Entry> _list = new List();
  List<Entry> _searchList = new List();

  _MyHomePage() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _searchText = "";
          _searchList = _list;
        });
      } else {
        setState(() {
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    bloc.fetchAlbums();
  }

  @override
  void dispose() {
    bloc.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBar(context),
      body: StreamBuilder(
        stream: bloc.allAlbums,
        builder: (context, AsyncSnapshot<TopAlbums> snapshot) {
          if (snapshot.hasData) {
            _list = snapshot.data.feed.entry;
            _searchList = _list;
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<TopAlbums> snapshot) {
    if (_searchText.isNotEmpty) {
      List tempList = new List();
      tempList = _list
          .where((element) => element.imName.label
              .toLowerCase()
              .contains(_searchText.toLowerCase()))
          .toList();
      _searchList = tempList.toList();
    }
    return GridView.builder(
        padding: new EdgeInsets.all(5.0),
        itemCount: _searchList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 4),
        itemBuilder: (BuildContext context, int index) {
          return UiItem(_searchList[index]);
        });
  }

  Widget _appBarTitle = new Text(
    'Top 100 albums',
    style: new TextStyle(
      color: Colors.white,
    ),
  );
  Icon _searchIcon = new Icon(Icons.search, color: Colors.white);

  Widget buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      actions: [
        new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ],
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close, color: Colors.white);
        this._appBarTitle = new TextField(
          controller: _searchQuery,
          style: new TextStyle(
            color: Colors.white,
          ),
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search, color: Colors.white),
              hintText: 'Search for album',
              hintStyle: new TextStyle(color: Colors.white)),
        );
      } else {
        this._searchIcon = new Icon(Icons.search, color: Colors.white);
        this._appBarTitle = new Text(
          'Top 100 albums',
          style: new TextStyle(color: Colors.white),
        );
        _searchList = _list;
        _searchQuery.clear();
      }
    });
  }
}

class UiItem extends StatelessWidget {
  final Entry entry;

  UiItem(this.entry);

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Material(
                  // with Material
                  child: Image.network(entry.imImage[2].label),
                  elevation: 12.0,
                  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 7, 0, 2.0),
                child: new Text(entry.imName.label,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                child: new Text("Price ${entry.imPrice.label}",
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontSize: 10.0,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center),
              )
            ],
          ),
          onTap: () {
            showSnackBar(context, entry.imName.label);
          },
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}
