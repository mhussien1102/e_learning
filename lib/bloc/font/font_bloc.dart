import 'package:bloc/bloc.dart';
import 'package:e_learning/bloc/font/font_envent.dart';
import 'package:e_learning/bloc/font/font_state.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/services/font_service.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  final GetStorage _storage = GetStorage();

  FontBloc()
    : super(
        FontState(
          fontScale: FontService.currentFontScale,
          fontFamily: FontService.currentFontFamily,
        ),
      ) {
    on<UpdateFontScale>(_onUpdateFontScale);
    on<UpdateFontFamily>(_onUpdateFontFamily);
  }

  void _onUpdateFontScale(
    UpdateFontScale event,
    Emitter<FontState> emit,
  ) async {
    await FontService.setFontScale(event.scale);
    emit(state.copyWith(fontScale: event.scale));
  }

  void _onUpdateFontFamily(
    UpdateFontFamily event,
    Emitter<FontState> emit,
  ) async {
    await FontService.setFontFamily(event.family);
    emit(state.copyWith(fontFamily: event.family));
  }
}
