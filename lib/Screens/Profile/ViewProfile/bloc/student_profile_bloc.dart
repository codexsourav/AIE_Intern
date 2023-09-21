import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../data/Network/api_network.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../../../data/model/StudentProfileModel.dart';
part 'student_profile_event.dart';
part 'student_profile_state.dart';

class StudentProfileBloc
    extends Bloc<StudentProfileEvent, StudentProfileState> {
  StudentProfileBloc() : super(StudentProfileInitial()) {
    // Whencall SetStudentProfileEvent
    on<SetStudentProfileEvent>((event, emit) async {
      // Emit Loading State
      emit(StudentProfileLoadingState());
      try {
        // Request Sever DAta Fetch
        var searchdata = await ApiNetwork.sendGetRequest(event.endpoint);
        List data = jsonDecode(searchdata.body);

        // Chack Data VAlidate
        if (data.isNotEmpty) {
          print(data);
          // StudentModel studentdata ="";
          // StudentModel.fromJson(data[0] as Map<String, dynamic>);
          // Set Data and Emit
          // emit(StudentProfileShowState(studentdata));
        } else {
          emit(StudentErrorState("No Student Found!"));
        }
      } catch (e) {
        debugPrint("Error Is => $e");
        emit(
          StudentErrorState("Sumthing Want Wrong!"),
        );

        // ignore: avoid_print
        print(e.toString());
      }
    });
  }
}
