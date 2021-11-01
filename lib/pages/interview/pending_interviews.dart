import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Interview {
  String info;

  Interview(this.info);
}

class PendingInterviewsView extends StatelessWidget {
  PendingInterviewsView({Key? key}) : super(key: key);

  String topic = "ENTREVISTAS PENDIENTES";
  DateTime time = DateTime.utc(2021, 12, 15);
  List<Interview> inters = [
    Interview("Desarrollador FrontEnd"),
    Interview("Desarrollador backend C#"),
    Interview("Desarrollador backend C#")
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle stylebtn = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Colors.blue[900]);

    return Scaffold(
        appBar: AppBar(title: Image.asset("assets/logo.png", height: 100.0, width: 50.0),
      centerTitle: true,
      leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Text(topic,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold)),
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.blue[900],
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                          child: Text(
                              time.day.toString() +
                                  " de " +
                                  time.month.toString() +
                                  " del " +
                                  time.year.toString(),
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold))),
                      ListView.builder(
                          itemCount: inters.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InterviewItem(inters[index]);
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: SizedBox(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Crear una nueva entrevista"),
                    style: stylebtn,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class InterviewItem extends StatelessWidget {
  final Interview inter;
  const InterviewItem(this.inter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(inter.info,
                          style:
                              TextStyle(fontSize: 12, color: Colors.blue[900], fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Hora: 8 am a 9 am",
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.meeting_room), onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.message_sharp), onPressed: () {}),
                    IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
