import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    {
      final suggetList = query.isEmpty
          ? countryList
          : countryList
              .where((element) =>
                  element['country'].toString().toLowerCase().startsWith(query))
              .toList();
      return ListView.builder(
        itemCount: suggetList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 5,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.grey[400],
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Image.network(
                            suggetList[index]['countryInfo']['flag'],
                            fit: BoxFit.fill,
                            height: 55,
                            width: 70,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          children: <Widget>[
                            Text(
                              suggetList[index]['country'].toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xFFc7381c),
                                  fontFamily: 'CreteRound',
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Cases: ' + suggetList[index]['cases'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4e71f2),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Hồi phục: ' +
                                  suggetList[index]['recovered'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF32c935),
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Deaths: ' +
                                  suggetList[index]['deaths'].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
