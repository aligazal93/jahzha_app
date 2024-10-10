// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hasalt_app/core/datasources/general.dart';
//
// import '../../models/city.dart';
// import '../../models/country.dart';
// import '../../models/nationality.dart';
// import '../../models/specialty.dart';
//
// part 'states.dart';
//
// class GeneralCubit extends Cubit<GeneralStates> {
//   GeneralCubit() : super(GeneralInit());
//
//   static GeneralCubit get of => BlocProvider.of(RouteUtils.context);
//
//   List<Country> countries = [];
//   List<Nationality> nationalities = [];
//   List<Specialty> trainerSpecialties = [];
//
//   Future<void> init() async {
//     _emit(GeneralLoading());
//     await Future.value([
//       await getCountries(),
//       await getTrainerSpecialties(),
//       await getNationalities(),
//     ]);
//     _emit(GeneralInit());
//   }
//
//   Future<void> getCountries() async {
//     countries = (await GeneralDatasource.getCountries()).cast<Country>();
//   }
//
//   Future<List<City>> getCities(String countryID) async {
//     final result = await GeneralDatasource.getCities(countryID);
//     return result;
//   }
//
//   Future<void> getNationalities() async {
//     nationalities = await GeneralDatasource.getNationalities();
//   }
//
//   Future<void> getTrainerSpecialties() async {
//     trainerSpecialties = await GeneralDatasource.getSpecialties();
//   }
//
//   bool get isStateLoading {
//     return state is GeneralLoading;
//   }
//
//   void _emit(GeneralStates state) {
//     if (!isClosed) {
//       emit(state);
//     }
//   }
// }