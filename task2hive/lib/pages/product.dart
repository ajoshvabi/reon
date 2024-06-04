import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task2hive/box.dart';
import 'package:task2hive/cartmodel.dart';

class Product extends StatefulWidget {
  final dynamic productdata;
  final bool? status;
  final int index;
  const Product(
      {super.key, this.productdata, this.status, required this.index});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
          // key: ValueKey(index),
          endActionPane: ActionPane(
              extentRatio: 1 / 3,
              motion: const BehindMotion(),
              children: [
                SlidableAction(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  onPressed: (context) async => {
                    widget.status == null
                        ? cartBox?.put(
                            widget.productdata['id'],
                            Cartmodel(
                                title: widget.productdata['title'],
                                description: widget.productdata['description'],
                                image: widget.productdata['image'],
                                price: widget.productdata['price']))
                        : setState(() {
                            cartBox?.deleteAt(widget.index);
                            log("up");
                          })
                  },
                  icon: Icons.shopping_cart,
                  foregroundColor: Colors.red,
                  backgroundColor: const Color.fromARGB(255, 255, 196, 196),
                  label: widget.status != null
                      ? "Remove\nfrom cart"
                      : "  Add\nto cart",
                )
              ]),
          child: Container(
            color: const Color.fromARGB(255, 206, 206, 206),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(widget.status == null
                          ? widget.productdata["image"]
                          : widget.productdata.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.status == null
                            ? widget.productdata['title'] ?? 'No title'
                            : widget.productdata.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Text(
                      "\$ ${widget.status == null ? widget.productdata['price'] : widget.productdata.price}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
