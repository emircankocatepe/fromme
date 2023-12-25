
import 'package:flutter/material.dart';
import 'furnitureList.dart';

void main() {
  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Project1(),
      );
  }
}
class Project1 extends StatefulWidget {
  const Project1({super.key});

  @override
  State<Project1> createState() => _Project1State();
}

bool isButtonActive = true;

class _Project1State extends State<Project1> {

final _textController = TextEditingController();

String userInput = '';

FurnitureLink furnitureFinder = FurnitureLink();

Color? colour = Colors.white.withOpacity(0);

List <Icon> scoreKeeper =[];
int correctAnswers=0, wrongAnswers=0;


void checkIt(){
  setState(() {
    
    String correct = furnitureFinder.QuestionEng();
  if(userInput!=correct){
    print('renk degisti');
    scoreKeeper.add(
         Icon(Icons.close,
        color: Colors.red,),
    );
    
    colour = Colors.red.withRed(255);
    correctAnswers++;
  }
  else {
    scoreKeeper.add(
        const Icon(Icons.check,
        color: Colors.green,),
    );
    
    colour = Colors.green.withGreen(220);
    wrongAnswers++;
   }
  
  });
  
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(

        leading:  IconButton(onPressed: (){
           setState(() {
            print('going back');
            furnitureFinder.goBack();
            furnitureFinder.QuestionImage();
            furnitureFinder.QuestionEng();
            furnitureFinder.QuestionTr();

            colour=Colors.white.withOpacity(0);
            isButtonActive=true;

            });
            
        },
           icon: const Icon(Icons.arrow_back_ios_new)),

        backgroundColor: Color.fromARGB(255, 126, 117, 255),
        title: const Text('Find The Gap'),
        actions: [
          
           IconButton(onPressed: (){
            setState(() {
            print('going forward');
            furnitureFinder.goForward();
            furnitureFinder.QuestionImage();
            furnitureFinder.QuestionEng();
            furnitureFinder.QuestionTr();
            
            colour=Colors.white.withOpacity(0);
            isButtonActive=true;
            });
            
           },
           icon: const Icon(Icons.arrow_forward_ios)),
  
        ],
        
        ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 222, 218, 255)),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        
        child: SafeArea(
          child:  Column (
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Expanded(
                flex: 7,
                child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  fit: BoxFit.scaleDown, 
                  image: AssetImage(furnitureFinder.QuestionImage())),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
              ),
              ),
                    const Expanded(
                  flex: 1,
                   child: SizedBox(
                     height: 4.0, 
                   ),
                    ),
                  Expanded(
                    flex: 3,
                    child: Text(
                        furnitureFinder.QuestionTr(),
                        style: const TextStyle(fontSize: 40.0,
                        ),
                        
                      ),
                  ),
                    
               Expanded(
                flex: 3,
                 child: Text(furnitureFinder.QuestionEng(),
                             style: TextStyle(

                             color: colour,
                             fontSize: 40.0,
                             ),
                           ),
               ),
          
          
                Expanded(
                  flex: 2,
                  child: TextField(
                        controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Enter your answer',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _textController.clear();
                            });
                            
                          },
                          icon: const Icon(
                            Icons.close,
                            ),),),
                            ),
                ),
                
                
              MaterialButton(
                
                disabledColor: Colors.green.shade100,
                onPressed:
              isButtonActive?
               (){
                setState(() 
                {
                  userInput = _textController.text;
                  _textController.clear();
                  checkIt();
                  isButtonActive=false;
                });
                
              }
              : null,
              
              height: 40.0,
              minWidth: 140.0,
              color: Colors.green,
              child: const Text('Check',style: TextStyle(color: Colors.white,fontSize: 25.0),),
              ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: scoreKeeper,
                      ),
                    )
          ],),
          
          ),
      ),
      
    );
  }
}