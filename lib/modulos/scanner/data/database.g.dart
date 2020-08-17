// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Leitura extends DataClass implements Insertable<Leitura> {
  final int id;
  final String dado;
  final DateTime createAt;
  Leitura({@required this.id, @required this.dado, this.createAt});
  factory Leitura.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Leitura(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      dado: stringType.mapFromDatabaseResponse(data['${effectivePrefix}dado']),
      createAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || dado != null) {
      map['dado'] = Variable<String>(dado);
    }
    if (!nullToAbsent || createAt != null) {
      map['create_at'] = Variable<DateTime>(createAt);
    }
    return map;
  }

  LeiturasCompanion toCompanion(bool nullToAbsent) {
    return LeiturasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      dado: dado == null && nullToAbsent ? const Value.absent() : Value(dado),
      createAt: createAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createAt),
    );
  }

  factory Leitura.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Leitura(
      id: serializer.fromJson<int>(json['id']),
      dado: serializer.fromJson<String>(json['dado']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dado': serializer.toJson<String>(dado),
      'createAt': serializer.toJson<DateTime>(createAt),
    };
  }

  Leitura copyWith({int id, String dado, DateTime createAt}) => Leitura(
        id: id ?? this.id,
        dado: dado ?? this.dado,
        createAt: createAt ?? this.createAt,
      );
  @override
  String toString() {
    return (StringBuffer('Leitura(')
          ..write('id: $id, ')
          ..write('dado: $dado, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(dado.hashCode, createAt.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Leitura &&
          other.id == this.id &&
          other.dado == this.dado &&
          other.createAt == this.createAt);
}

class LeiturasCompanion extends UpdateCompanion<Leitura> {
  final Value<int> id;
  final Value<String> dado;
  final Value<DateTime> createAt;
  const LeiturasCompanion({
    this.id = const Value.absent(),
    this.dado = const Value.absent(),
    this.createAt = const Value.absent(),
  });
  LeiturasCompanion.insert({
    this.id = const Value.absent(),
    @required String dado,
    this.createAt = const Value.absent(),
  }) : dado = Value(dado);
  static Insertable<Leitura> custom({
    Expression<int> id,
    Expression<String> dado,
    Expression<DateTime> createAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dado != null) 'dado': dado,
      if (createAt != null) 'create_at': createAt,
    });
  }

  LeiturasCompanion copyWith(
      {Value<int> id, Value<String> dado, Value<DateTime> createAt}) {
    return LeiturasCompanion(
      id: id ?? this.id,
      dado: dado ?? this.dado,
      createAt: createAt ?? this.createAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dado.present) {
      map['dado'] = Variable<String>(dado.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LeiturasCompanion(')
          ..write('id: $id, ')
          ..write('dado: $dado, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }
}

class $LeiturasTable extends Leituras with TableInfo<$LeiturasTable, Leitura> {
  final GeneratedDatabase _db;
  final String _alias;
  $LeiturasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dadoMeta = const VerificationMeta('dado');
  GeneratedTextColumn _dado;
  @override
  GeneratedTextColumn get dado => _dado ??= _constructDado();
  GeneratedTextColumn _constructDado() {
    return GeneratedTextColumn(
      'dado',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  GeneratedDateTimeColumn _createAt;
  @override
  GeneratedDateTimeColumn get createAt => _createAt ??= _constructCreateAt();
  GeneratedDateTimeColumn _constructCreateAt() {
    return GeneratedDateTimeColumn('create_at', $tableName, true,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns => [id, dado, createAt];
  @override
  $LeiturasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'leituras';
  @override
  final String actualTableName = 'leituras';
  @override
  VerificationContext validateIntegrity(Insertable<Leitura> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('dado')) {
      context.handle(
          _dadoMeta, dado.isAcceptableOrUnknown(data['dado'], _dadoMeta));
    } else if (isInserting) {
      context.missing(_dadoMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at'], _createAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Leitura map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Leitura.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $LeiturasTable createAlias(String alias) {
    return $LeiturasTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $LeiturasTable _leituras;
  $LeiturasTable get leituras => _leituras ??= $LeiturasTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [leituras];
}
