import 'package:flutter/material.dart';
import 'package:tests/utils/http_request.dart';

void main() {
  runApp(const HttpRestAPI());
}

class HttpRestAPI extends StatelessWidget {
  const HttpRestAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuridal Class',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HttpPackagePage(title: 'Nuridal Class: Http Rest API Demo'),
    );
  }
}

class HttpPackagePage extends StatefulWidget {
  const HttpPackagePage({super.key, required this.title});

  final String title;

  @override
  State<HttpPackagePage> createState() => _HttpPackagePageState();
}

Map<String, dynamic>? apiResult;

class _HttpPackagePageState extends State<HttpPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  apiResult = await httpGet(path: '/api/users?page=2');
                  print(apiResult);
                },
                child: const Text('API CALL'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
