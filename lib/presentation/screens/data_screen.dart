import 'package:app4_api/data/models/news_model.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    final Result arguments =
        ModalRoute.of(context)!.settings.arguments as Result;
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              arguments.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Hero(
              tag: arguments.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  width: 170,
                  height: 250,
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(
                    arguments.imageUrl ??
                        'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Descripcion: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(arguments.description),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "More Information: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Wrap(
              children: [
                Text(
                  "Country: ${arguments.country[0]}",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  "Creator: ${arguments.creator[0]}",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Link new: ${arguments.link[0]}",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                )
              ],
            ),
            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Text("Country: ${arguments.country[0]}"),
            //     Text("Creator: ${arguments.creator[0]}"),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Text("Link new: ${arguments.link[0]}")
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Abriendo comentarios");
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Ingresa tu comentario"),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black38,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.chat),
        ),
      ),
    );
  }
}
