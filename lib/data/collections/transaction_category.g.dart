// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTransactionCategoryCollectionCollection on Isar {
  IsarCollection<TransactionCategoryCollection>
      get transactionCategoryCollections => this.collection();
}

const TransactionCategoryCollectionSchema = CollectionSchema(
  name: r'TransactionCategoryCollection',
  id: -5219473256549161703,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'transactionType': PropertySchema(
      id: 1,
      name: r'transactionType',
      type: IsarType.string,
      enumMap: _TransactionCategoryCollectiontransactionTypeEnumValueMap,
    )
  },
  estimateSize: _transactionCategoryCollectionEstimateSize,
  serialize: _transactionCategoryCollectionSerialize,
  deserialize: _transactionCategoryCollectionDeserialize,
  deserializeProp: _transactionCategoryCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'transactions': LinkSchema(
      id: -3600017377283926137,
      name: r'transactions',
      target: r'TransactionCollection',
      single: false,
      linkName: r'category',
    )
  },
  embeddedSchemas: {},
  getId: _transactionCategoryCollectionGetId,
  getLinks: _transactionCategoryCollectionGetLinks,
  attach: _transactionCategoryCollectionAttach,
  version: '3.0.5',
);

int _transactionCategoryCollectionEstimateSize(
  TransactionCategoryCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.transactionType.name.length * 3;
  return bytesCount;
}

void _transactionCategoryCollectionSerialize(
  TransactionCategoryCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeString(offsets[1], object.transactionType.name);
}

TransactionCategoryCollection _transactionCategoryCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionCategoryCollection(
    name: reader.readString(offsets[0]),
    transactionType: _TransactionCategoryCollectiontransactionTypeValueEnumMap[
            reader.readStringOrNull(offsets[1])] ??
        TransactionType.income,
  );
  object.id = id;
  return object;
}

P _transactionCategoryCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_TransactionCategoryCollectiontransactionTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TransactionType.income) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TransactionCategoryCollectiontransactionTypeEnumValueMap = {
  r'income': r'income',
  r'spent': r'spent',
};
const _TransactionCategoryCollectiontransactionTypeValueEnumMap = {
  r'income': TransactionType.income,
  r'spent': TransactionType.spent,
};

Id _transactionCategoryCollectionGetId(TransactionCategoryCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionCategoryCollectionGetLinks(
    TransactionCategoryCollection object) {
  return [object.transactions];
}

void _transactionCategoryCollectionAttach(
    IsarCollection<dynamic> col, Id id, TransactionCategoryCollection object) {
  object.id = id;
  object.transactions.attach(
      col, col.isar.collection<TransactionCollection>(), r'transactions', id);
}

extension TransactionCategoryCollectionQueryWhereSort on QueryBuilder<
    TransactionCategoryCollection, TransactionCategoryCollection, QWhere> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionCategoryCollectionQueryWhere on QueryBuilder<
    TransactionCategoryCollection,
    TransactionCategoryCollection,
    QWhereClause> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TransactionCategoryCollectionQueryFilter on QueryBuilder<
    TransactionCategoryCollection,
    TransactionCategoryCollection,
    QFilterCondition> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeEqualTo(
    TransactionType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeGreaterThan(
    TransactionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeLessThan(
    TransactionType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeBetween(
    TransactionType lower,
    TransactionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
          QAfterFilterCondition>
      transactionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
          QAfterFilterCondition>
      transactionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionType',
        value: '',
      ));
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionType',
        value: '',
      ));
    });
  }
}

extension TransactionCategoryCollectionQueryObject on QueryBuilder<
    TransactionCategoryCollection,
    TransactionCategoryCollection,
    QFilterCondition> {}

extension TransactionCategoryCollectionQueryLinks on QueryBuilder<
    TransactionCategoryCollection,
    TransactionCategoryCollection,
    QFilterCondition> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
          QAfterFilterCondition>
      transactions(FilterQuery<TransactionCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'transactions');
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', length, true, length, true);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', 0, true, 0, true);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', 0, false, 999999, true);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', 0, true, length, include);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'transactions', length, include, 999999, true);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterFilterCondition> transactionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'transactions', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TransactionCategoryCollectionQuerySortBy on QueryBuilder<
    TransactionCategoryCollection, TransactionCategoryCollection, QSortBy> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> sortByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.asc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> sortByTransactionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.desc);
    });
  }
}

extension TransactionCategoryCollectionQuerySortThenBy on QueryBuilder<
    TransactionCategoryCollection, TransactionCategoryCollection, QSortThenBy> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> thenByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.asc);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QAfterSortBy> thenByTransactionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.desc);
    });
  }
}

extension TransactionCategoryCollectionQueryWhereDistinct on QueryBuilder<
    TransactionCategoryCollection, TransactionCategoryCollection, QDistinct> {
  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QDistinct> distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionCategoryCollection,
      QDistinct> distinctByTransactionType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionType',
          caseSensitive: caseSensitive);
    });
  }
}

extension TransactionCategoryCollectionQueryProperty on QueryBuilder<
    TransactionCategoryCollection,
    TransactionCategoryCollection,
    QQueryProperty> {
  QueryBuilder<TransactionCategoryCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionCategoryCollection, String, QQueryOperations>
      nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TransactionCategoryCollection, TransactionType, QQueryOperations>
      transactionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionType');
    });
  }
}
