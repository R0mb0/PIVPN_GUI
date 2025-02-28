Yes, in Dart (and Flutter), you can start a new thread using the `compute` function from the `flutter/foundation.dart` library, which is particularly useful for offloading heavy computations to a separate thread. However, Dart does not have traditional threads like some other languages. Instead, it uses isolates for concurrent programming.

Here's an example of how to start a new isolate and control it:

```dart name=main.dart
import 'dart:async';
import 'dart:isolate';

void main() async {
  // Start a new isolate
  final response = await startNewIsolate('Hello from main isolate');
  print(response);
}

Future<String> startNewIsolate(String message) async {
  // Create a ReceivePort to receive messages from the isolate
  final receivePort = ReceivePort();
  
  // Spawn a new isolate
  await Isolate.spawn(isolateEntry, receivePort.sendPort);

  // Send a message to the isolate
  final sendPort = await receivePort.first as SendPort;
  final responsePort = ReceivePort();
  sendPort.send([message, responsePort.sendPort]);

  // Wait for the response from the isolate
  return await responsePort.first as String;
}

void isolateEntry(SendPort sendPort) {
  // Create a ReceivePort to receive messages from the main isolate
  final receivePort = ReceivePort();

  // Send the SendPort of the receivePort to the main isolate
  sendPort.send(receivePort.sendPort);

  // Listen for messages from the main isolate
  receivePort.listen((message) {
    final data = message[0] as String;
    final responsePort = message[1] as SendPort;

    // Perform some computation (simulate with a delay)
    Future.delayed(Duration(seconds: 2), () {
      // Send the response back to the main isolate
      responsePort.send('Hello from new isolate, received: $data');
    });
  });
}
```

In this example:

1. The `main` function starts a new isolate by calling the `startNewIsolate` function and waits for its response.
2. The `startNewIsolate` function creates a `ReceivePort` to receive messages from the new isolate and spawns the new isolate with the `Isolate.spawn` method. It then waits for the send port of the new isolate and sends a message to it.
3. The `isolateEntry` function is the entry point of the new isolate. It creates a `ReceivePort` to receive messages from the main isolate, sends its send port back to the main isolate, and listens for messages. Upon receiving a message, it performs some computation and sends a response back to the main isolate.

This way, you can start a new isolate and communicate with it.
