import 'dart:convert';

import 'package:lobevent_backend/model/Event.dart';

import '../harness/app.dart';
import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:lobevent_backend/lobevent_backend.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';


void main() {
  final harness = Harness()..install();

  test("POST Event Works", () async {
    Event event = Event();
    event.user.id = 2;
    event.name = "hallo";
    event.date = DateTime(1997, 11, 22);
    final response = await harness.agent.post("/events", body: {
      "user_id" : 2,
      "name" : "hallo",
      "date" : "275760-09-13"
    });
    expect(jsonDecode(response.body.toString())["user_id"], "2");
  });
}