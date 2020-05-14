import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

ExpansionTileCard getCard(String title, String description) {
  return ExpansionTileCard(
    baseColor: Colors.transparent,
    expandedColor: Colors.transparent,
    leading: const Icon(
      Icons.info_outline,
      color: Colors.black,
    ),
    title: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    ),
    children: <Widget>[
      const Divider(
        thickness: 1.0,
        height: 1.0,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              """ $description""",
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
          ),
        ),
      ),
    ],
  );
}
