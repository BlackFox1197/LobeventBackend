import 'dart:convert';

import 'package:lobevent_backend/model/Event.dart';

import 'harness/app.dart';
import 'package:lobevent_backend/lobevent_backend.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

export 'package:lobevent_backend/lobevent_backend.dart';
export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';


void main() {
  final harness = Harness()..install();

  test("POST Event Works", () async {
    final response = await harness.agent.post("/events", body: {
      "user" : {"id" : 2},
      "name" : "hallo",
      "date" : "275760-09-13"
    });
    expectResponse(response, 200);
       // jsonDecode(response.body.toString())["user"]["id"], "2");
  });
}