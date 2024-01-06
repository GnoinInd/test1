import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_app/consts/text_style.dart';
import 'package:music_player_app/controllers/player_controller.dart';
import 'package:music_player_app/view/player.dart';
import 'package:on_audio_query/on_audio_query.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(PlayerController());
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.search, color: Colors.white ,))
        ],
        leading: Icon(Icons.sort_rounded, color: Colors.white,),
        title: Text(
          "Beats",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "bold",
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        builder: (BuildContext context, snapshot){
          if(snapshot.data == null){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.data!.isEmpty){
            return Center(
              child: Text("No song found",
              style: ourStyle(),),
            );
          }else{
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 4),
                      child: Obx(() =>ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          title: Text(snapshot.data![index].displayNameWOExt, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
                          ),),
                          subtitle:Text("${snapshot.data![index].artist}", style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white,
                          ),),
                          leading: QueryArtworkWidget(id: snapshot.data![index].id,type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(Icons.music_note,color: Colors.white,size: 32,),),
                          trailing: controller.playIndex.value == index && controller.isPlaying.value?const Icon(Icons.play_arrow,color: Colors.white,size: 26,):null,
                          onTap: (){
                            Get.to(()=> const Player());
                           // controller.playSong(snapshot.data![index].uri, index);
                          },
                        ),
                      ),
                    );
                  }),
            );
          }
        },
      )
    );
  }
}
