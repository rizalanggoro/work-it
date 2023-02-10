// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const DetailCollectionSchema = Schema(
  name: r'DetailCollection',
  id: -3974295119069589925,
  properties: {
    r'createAtEpoch': PropertySchema(
      id: 0,
      name: r'createAtEpoch',
      type: IsarType.long,
    ),
    r'isUploaded': PropertySchema(
      id: 1,
      name: r'isUploaded',
      type: IsarType.bool,
    ),
    r'updatedAtEpoch': PropertySchema(
      id: 2,
      name: r'updatedAtEpoch',
      type: IsarType.long,
    )
  },
  estimateSize: _detailCollectionEstimateSize,
  serialize: _detailCollectionSerialize,
  deserialize: _detailCollectionDeserialize,
  deserializeProp: _detailCollectionDeserializeProp,
);

int _detailCollectionEstimateSize(
  DetailCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _detailCollectionSerialize(
  DetailCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.createAtEpoch);
  writer.writeBool(offsets[1], object.isUploaded);
  writer.writeLong(offsets[2], object.updatedAtEpoch);
}

DetailCollection _detailCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DetailCollection(
    createAtEpoch: reader.readLongOrNull(offsets[0]),
    isUploaded: reader.readBoolOrNull(offsets[1]),
    updatedAtEpoch: reader.readLongOrNull(offsets[2]),
  );
  return object;
}

P _detailCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DetailCollectionQueryFilter
    on QueryBuilder<DetailCollection, DetailCollection, QFilterCondition> {
  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      createAtEpochIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createAtEpoch',
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      createAtEpochIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createAtEpoch',
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      createAtEpochEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAtEpoch',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      createAtEpochGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAtEpoch',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      createAtEpochLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAtEpoch',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      createAtEpochBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAtEpoch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      isUploadedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isUploaded',
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      isUploadedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isUploaded',
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      isUploadedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUploaded',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      updatedAtEpochIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAtEpoch',
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      updatedAtEpochIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAtEpoch',
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      updatedAtEpochEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAtEpoch',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      updatedAtEpochGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAtEpoch',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      updatedAtEpochLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAtEpoch',
        value: value,
      ));
    });
  }

  QueryBuilder<DetailCollection, DetailCollection, QAfterFilterCondition>
      updatedAtEpochBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAtEpoch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DetailCollectionQueryObject
    on QueryBuilder<DetailCollection, DetailCollection, QFilterCondition> {}
