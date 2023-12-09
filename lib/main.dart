import 'package:flutter/material.dart';
import 'package:fun_chat/src/chat/presentation/stream/chat.dart';
import 'package:fun_chat/core/services/router.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:web_socket_channel/io.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatApp extends StatefulWidget {
  ChatApp({super.key});
  String name = 'Bikraj';
  String message = '';

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  late TextEditingController messageController;
  late Socket socket;
  late IOWebSocketChannel channel;
  late StreamSocket socketStream;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    socketStream = StreamSocket();
    socket = io(
        'http://localhost:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket
      ..connect()
      ..onConnect((data) {
        debugPrint('connected to the socket');
      })
      ..on('chatMessage', (data) => socketStream.addResponse(data as String))
      // ignore: avoid_print
      ..onDisconnect((data) => print('disconnected'));
  }

  @override
  void dispose() {
    messageController.dispose();
    socket.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      socket.emit('chatMessage', messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder<Object>(
              stream: socketStream.getResponse,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: messageController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _sendMessage();
                      },
                      child: const Text('Send'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (snapshot.hasData) Text(snapshot.data as String)
                  ],
                );
              }),
        ),
      ),
    );
  }
}
