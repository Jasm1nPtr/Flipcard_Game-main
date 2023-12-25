import 'package:flipcard_game/app/data/data.dart';
import 'package:flipcard_game/app/modules/home/views/flipcard_view1/flipcardgame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlipGameView extends StatefulWidget {
  @override
  _FlipGameViewState createState() => _FlipGameViewState();
}

class _FlipGameViewState extends State<FlipGameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                // Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    children: [
                      Image.asset(
                        "lib/app/assets/home.png",
                        fit: BoxFit.cover,
                        width: 170.0,
                        height: double.infinity,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Indahnya",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Peninggalan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Sejarah",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => _list[index].goto,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _list[index].primarycolor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.black45,
                                spreadRadius: 0.5,
                                offset: Offset(3, 4),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _list[index].secondarycolor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.black12,
                                spreadRadius: 0.3,
                                offset: Offset(5, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  _list[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black26,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                      Shadow(
                                        color: Colors.green,
                                        blurRadius: 2,
                                        offset: Offset(0.5, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: generateStar(_list[index].noOfstar),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateStar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.add(
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primarycolor;
  Color secondarycolor;
  Widget goto;
  int noOfstar;

  Details({
    required this.name,
    required this.primarycolor,
    required this.secondarycolor,
    required this.noOfstar,
    required this.goto,
  });
}

List<Details> _list = [
  Details(
    name: "EASY",
    primarycolor: Colors.green,
    secondarycolor: Colors.green[300]!,
    noOfstar: 1,
    goto: FlipCardGame(Level.Easy),
  ),
  Details(
    name: "MEDIUM",
    primarycolor: Colors.orange,
    secondarycolor: Colors.orange[300]!,
    noOfstar: 2,
    goto: FlipCardGame(Level.Medium),
  ),
  Details(
    name: "HARD",
    primarycolor: Colors.red,
    secondarycolor: Colors.red[300]!,
    noOfstar: 3,
    goto: FlipCardGame(Level.Hard),
  ),
];
