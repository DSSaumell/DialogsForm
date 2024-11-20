import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Recuperar el valor d''un camp de text',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      home: MycustomForm(),
    );
  }
}

class MycustomForm extends StatefulWidget {
  const MycustomForm({super.key});
  @override
  State<MycustomForm> createState() => _MycustomFormState();
}

class _MycustomFormState extends State<MycustomForm> {
  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Recuperar valor d\'un camp de text'),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context, 
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text(myController.text)
                        );
                      }
                    );
                  }, 
                  child: const Text ('SimpleDialog')
                ),
                const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(myController.text),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }, 
                  child: const Text ('SnackBar')
                ),
                const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,  
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("AlertDialog"),
                          content: Text(myController.text),
                          actions: [
                            TextButton(
                              onPressed:() {Navigator.of(context).pop(); },
                               child: const Text('Aceptar'),
                            ),
                            ElevatedButton(
                              onPressed:() { Navigator.of(context).pop(); },
                              child: const Text('Cancelar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text ('AlertDialog'), 
                ),
                const Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0)),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        final double modalHeight = MediaQuery.of(context).size.height * 0.20;
                        
                        return Container(
                          width: double.infinity,
                          height: modalHeight,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(myController.text),
                              TextButton( 
                                onPressed: () { Navigator.of(context).pop(); },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text('Aceptar'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text ('ModalBottomSheet'), 
                ),
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
