import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
            )),
            const SizedBox(height: 12,),
            Expanded(child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                )
              ),
              child: Column(
                children: [
                  Text("Music name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
                  SizedBox(height:12,),
                  Text("Artist name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 20),),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Text(
                        "0:0",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(child: Slider(
                        thumbColor: Colors.grey,
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          value: 0.0, onChanged: (newValue){})),
                      Text("04:08",style: TextStyle(color: Colors.black),)
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){}, icon: const Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                      )),
                      CircleAvatar(
                        radius: 35,
                          backgroundColor: Colors.black,
                          child: Transform.scale(
                            scale: 2.5,
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.play_arrow_rounded,size: 54,)))),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next_rounded,size: 40,)),
                    ],
                  )
                ],
              ),
            )
            )
          ],
        ),
      ),

    );
  }
}
