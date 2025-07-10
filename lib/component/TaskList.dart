import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

ListView TaskList(TaskItems){
  return ListView.builder(
    itemCount: TaskItems.length,
    itemBuilder: (context,index){

      Color statusColor =colorGreen;

      if(TaskItems[index]['status']=="NEW"){
        statusColor = colorBlue;
      }
      if(TaskItems[index]['status']=="Progress"){
        statusColor = colorOrange;
      }
      if(TaskItems[index]['status']=="Cancel"){
        statusColor = colorRed;
      }




      return Card(
        color: Colors.greenAccent,
        child: ItemSizeBox(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TaskItems[index]["title"],style: Head6Text(colorDarkBlue),),
              Text(TaskItems[index]["description"],style: Head7Text(colorLightGray),),
              Text(TaskItems[index]["createdDate"],style: Head7Text(colorLightGray),),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusChild(TaskItems[index]['status'],statusColor),

                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 50,height: 30,
                        child: ElevatedButton(onPressed: (){}, child: Icon(Icons.edit_location_alt_outlined,size: 16,),style: AppStatusButtonStyle(colorBlue),),),
                        SizedBox(width: 10,),
                        SizedBox(width: 50,height: 30,
                        child: ElevatedButton(onPressed: (){}, child: Icon(Icons.delete_outlined,size: 16,),style: AppStatusButtonStyle(colorRed),),),

                      ],
                    ),
                  )
                ],
              )

            ],
          )
        ),
      );
    },
  );
}