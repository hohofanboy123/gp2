import 'package:cached_network_image/cached_network_image.dart';
import 'package:fexercise/data/model/muscle_model.dart';
import 'package:fexercise/essential/constants/global_constants.dart';
import 'package:flutter/material.dart';

import '../../link_api.dart';

class CustomGridView extends StatelessWidget {
  final MuscleModel muscleModel;
  const CustomGridView({super.key, required this.muscleModel});

  @override
  Widget build(BuildContext context) {
        return
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  shadowColor: blue1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)) ,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                                                imageUrl: "${ApiLinks.muscleImg}/${muscleModel.muscleImage!}",
                                                height: 150,
                                                width: 150,
                                              ),

                            Text(muscleModel.muscleNameEn!,
                              style: const TextStyle(fontSize: 15),
                            ),
                      ],
                    ),
                  ));
                  //Text(muscleModel.muscleNameEn!),

  }
}
