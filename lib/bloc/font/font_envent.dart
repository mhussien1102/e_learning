import 'package:equatable/equatable.dart';

abstract class FontEvent extends Equatable {
  List<Object?> get props => [];
}

class UpdateFontScale extends FontEvent {
  final double scale;

  UpdateFontScale(this.scale);

  List<Object?> get props => [scale];
}

class UpdateFontFamily extends FontEvent {
  final String family;

  UpdateFontFamily(this.family);

  List<Object?> get props => [family];
}
