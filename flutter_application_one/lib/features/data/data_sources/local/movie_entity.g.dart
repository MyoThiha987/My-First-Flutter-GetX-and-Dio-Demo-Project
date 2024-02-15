// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieBoxAdapter extends TypeAdapter<MovieBox> {
  @override
  final int typeId = 0;

  @override
  MovieBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieBox(
      id: fields[0] as int,
      originalTitle: fields[1] as String,
      overview: fields[2] as String,
      popularity: fields[3] as double,
      posterPath: fields[4] as String,
      releaseDate: fields[5] as String,
      voteAverage: fields[6] as double,
      voteCount: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieBox obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.originalTitle)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.popularity)
      ..writeByte(4)
      ..write(obj.posterPath)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
