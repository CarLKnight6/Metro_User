import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close, color: Colors.red),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'E-Ticket',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Row(
              children: const [
                Text(
                  'ORIGIN',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.local_taxi_outlined,
                    color: Colors.amber,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'DST',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Booked Succesfully!',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketDetailsWidget(
                  'Passengers', 'Hafiz M Mujahid', 'Date', '28-08-2022'),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                child: ticketDetailsWidget(
                    'Driver', 'Lance Olana', 'Plate #', '66B'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child:
                    ticketDetailsWidget('Origin', 'Current Location', '', ''),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ticketDetailsWidget('Destination', 'Business', '', ''),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child:
                    ticketDetailsWidget('Distance', '100km', 'Fare', '200php'),
              ),
            ],
          ),
        ),
        const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
                child: Center(
                    child: Text(
                  'Developer: SCiVER IT Solutions',
                  style: TextStyle(fontSize: 16, color: Colors.amber),
                )))),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
            child: Text(
              '09980064774',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextBold(
            text: 'Screenshot your E-Ticket', fontSize: 12, color: Colors.grey),
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
