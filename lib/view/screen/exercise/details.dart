import 'package:fexercise/controller/exercise_detail_controller.dart';
import 'package:fexercise/data/model/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../essential/constants/global_constants.dart';
import '../../../essential/functions/db_translation.dart';
import '../../widget/youtube_container.dart';

class ExerciseDetail extends GetView<ExerciseDetailsControllerImp> {
  const ExerciseDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 5),
      itemCount: controller.exercise.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return DetailExercise(
          i: index,
          exerciseDetailModel:
              ExerciseDetailModel.fromJson(controller.exercise[index]),
        );
      },
    );
  }
}

class DetailExercise extends GetView<ExerciseDetailsControllerImp> {
  final ExerciseDetailModel exerciseDetailModel;
  final num? i;
  const DetailExercise({Key? key, required this.exerciseDetailModel, required this.i})
      : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    List<String> steps = translateDB(exerciseDetailModel.exerciseDescription!.split('\n\n'), exerciseDetailModel.exerciseDescriptionAr!.split('\n\n'));
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      elevation: 5,
      shadowColor: blue1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
                children: [
                  Text(
                    "${translateDB(exerciseDetailModel.exerciseNameEn, exerciseDetailModel.exerciseNameAr)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  GetBuilder<ExerciseDetailsControllerImp>(
                    builder:(controller) => 
                        YoutubeContainer(vidurl: "${exerciseDetailModel.exerciseUrl}",)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("diff".tr, style: const TextStyle(fontSize: 15),),
                          SizedBox(
                            width: 100,
                            child: LinearProgressIndicator(
                              minHeight: 5,
                              backgroundColor:
                                (exerciseDetailModel.exerciseDifficulty!) == 0.33 ?
                              Colors.green.withOpacity(0.5)
                              : (exerciseDetailModel.exerciseDifficulty!) == 0.66 ?
                              Colors.orange.withOpacity(0.5)
                              : 
                              Colors.red.withOpacity(0.5),
                                            
                              valueColor:
                                (exerciseDetailModel.exerciseDifficulty!) == 0.33 ?
                              const AlwaysStoppedAnimation<Color>(Colors.green)
                              : (exerciseDetailModel.exerciseDifficulty!) == 0.66 ?
                              const AlwaysStoppedAnimation<Color>(Colors.orange)
                              : 
                              const AlwaysStoppedAnimation<Color>(Colors.red),
                                            
                                            
                              value: (exerciseDetailModel.exerciseDifficulty!).toDouble(),
                            ),
                          ),
                          const SizedBox(width: 50,),
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.favorite),
                            color: Colors.red,
                            )
                      ],
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: blue1.withOpacity(0.5),
                            spreadRadius: 2.5,
                            blurRadius: 5,
                            offset: const Offset(0, 3)
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: blue1,
                        ),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal:10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              height: 75,
                              decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: blue1,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0XFF48647D),
                                  offset: Offset(4, 4),
                                  blurRadius: 10,
                                ),
                                BoxShadow(
                                  color: Color(0XFF6A8AA6),
                                  offset: Offset(-4, -4),
                                  blurRadius: 10,
                                )
                              ]
                              ),
                              child: Center(
                              child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                              ),
                            ),
                            ),
                            ),
                            const SizedBox(width: 10,),
                        Expanded(
                          flex: 5,
                          child: Text(
                            steps[index],
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        ],
                      ),
                    );
                  },
                ),
                ]),
      ),
    );
  }
}
