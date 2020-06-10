import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planets/planet_card.dart';
import 'models/planet.dart';

class PlanetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          color: new Color(0xFF333366),
          child: StreamBuilder(
            stream: Firestore.instance.collection("planets").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              return ListView.builder(
                itemBuilder: (context, index) => new PlanetCard(planet: Planet.fromFB(snapshot.data.documents[index])),
                itemCount: snapshot.data.documents.length,
              );
          },
          )
      ),
    );
  }
}