import 'package:equatable/equatable.dart';

class FontState extends Equatable {
  final double fontScale;
  final String fontFamily;

  FontState({required this.fontScale, required this.fontFamily});

  List<Object?> get props => [fontScale, fontFamily];

  FontState copyWith({double? fontScale, String? fontFamily}) {
    return FontState(
      fontScale: fontScale ?? this.fontScale,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
