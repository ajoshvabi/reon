import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task2hive/box.dart';

class Cartlist extends StatefulWidget {
  const Cartlist({super.key});

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartBox?.length,
      itemBuilder: (context, index) {
        final product = cartBox?.getAt(index);
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
                              setState(() {
                                cartBox?.deleteAt(index);
                              })
                            },
                        icon: Icons.shopping_cart,
                        foregroundColor: Colors.red,
                        backgroundColor:
                            const Color.fromARGB(255, 255, 196, 196),
                        label: 'Remove\nfrom cart')
                  ]),
              child: Container(
                color: const Color.fromARGB(255, 206, 206, 206),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          image: NetworkImage(product.image),
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
                            product.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          '\$ ${product.price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
