// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MedicineEntityTable extends MedicineEntity
    with TableInfo<$MedicineEntityTable, MedicineEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicineEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<String> strength = GeneratedColumn<String>(
    'strength',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _inventoryCountMeta = const VerificationMeta(
    'inventoryCount',
  );
  @override
  late final GeneratedColumn<int> inventoryCount = GeneratedColumn<int>(
    'inventory_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    strength,
    instructions,
    notes,
    inventoryCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicine_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicineEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('inventory_count')) {
      context.handle(
        _inventoryCountMeta,
        inventoryCount.isAcceptableOrUnknown(
          data['inventory_count']!,
          _inventoryCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicineEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      inventoryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inventory_count'],
      ),
    );
  }

  @override
  $MedicineEntityTable createAlias(String alias) {
    return $MedicineEntityTable(attachedDatabase, alias);
  }
}

class MedicineEntityData extends DataClass
    implements Insertable<MedicineEntityData> {
  final int id;
  final String name;
  final String type;
  final String? strength;
  final String? instructions;
  final String? notes;
  final int? inventoryCount;
  const MedicineEntityData({
    required this.id,
    required this.name,
    required this.type,
    this.strength,
    this.instructions,
    this.notes,
    this.inventoryCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<String>(strength);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || inventoryCount != null) {
      map['inventory_count'] = Variable<int>(inventoryCount);
    }
    return map;
  }

  MedicineEntityCompanion toCompanion(bool nullToAbsent) {
    return MedicineEntityCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      strength: strength == null && nullToAbsent
          ? const Value.absent()
          : Value(strength),
      instructions: instructions == null && nullToAbsent
          ? const Value.absent()
          : Value(instructions),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      inventoryCount: inventoryCount == null && nullToAbsent
          ? const Value.absent()
          : Value(inventoryCount),
    );
  }

  factory MedicineEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicineEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      strength: serializer.fromJson<String?>(json['strength']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      notes: serializer.fromJson<String?>(json['notes']),
      inventoryCount: serializer.fromJson<int?>(json['inventoryCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'strength': serializer.toJson<String?>(strength),
      'instructions': serializer.toJson<String?>(instructions),
      'notes': serializer.toJson<String?>(notes),
      'inventoryCount': serializer.toJson<int?>(inventoryCount),
    };
  }

  MedicineEntityData copyWith({
    int? id,
    String? name,
    String? type,
    Value<String?> strength = const Value.absent(),
    Value<String?> instructions = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<int?> inventoryCount = const Value.absent(),
  }) => MedicineEntityData(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    strength: strength.present ? strength.value : this.strength,
    instructions: instructions.present ? instructions.value : this.instructions,
    notes: notes.present ? notes.value : this.notes,
    inventoryCount: inventoryCount.present
        ? inventoryCount.value
        : this.inventoryCount,
  );
  MedicineEntityData copyWithCompanion(MedicineEntityCompanion data) {
    return MedicineEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      strength: data.strength.present ? data.strength.value : this.strength,
      instructions: data.instructions.present
          ? data.instructions.value
          : this.instructions,
      notes: data.notes.present ? data.notes.value : this.notes,
      inventoryCount: data.inventoryCount.present
          ? data.inventoryCount.value
          : this.inventoryCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicineEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('strength: $strength, ')
          ..write('instructions: $instructions, ')
          ..write('notes: $notes, ')
          ..write('inventoryCount: $inventoryCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    strength,
    instructions,
    notes,
    inventoryCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicineEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.strength == this.strength &&
          other.instructions == this.instructions &&
          other.notes == this.notes &&
          other.inventoryCount == this.inventoryCount);
}

class MedicineEntityCompanion extends UpdateCompanion<MedicineEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String?> strength;
  final Value<String?> instructions;
  final Value<String?> notes;
  final Value<int?> inventoryCount;
  const MedicineEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.strength = const Value.absent(),
    this.instructions = const Value.absent(),
    this.notes = const Value.absent(),
    this.inventoryCount = const Value.absent(),
  });
  MedicineEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    this.strength = const Value.absent(),
    this.instructions = const Value.absent(),
    this.notes = const Value.absent(),
    this.inventoryCount = const Value.absent(),
  }) : name = Value(name),
       type = Value(type);
  static Insertable<MedicineEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? strength,
    Expression<String>? instructions,
    Expression<String>? notes,
    Expression<int>? inventoryCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (strength != null) 'strength': strength,
      if (instructions != null) 'instructions': instructions,
      if (notes != null) 'notes': notes,
      if (inventoryCount != null) 'inventory_count': inventoryCount,
    });
  }

  MedicineEntityCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? type,
    Value<String?>? strength,
    Value<String?>? instructions,
    Value<String?>? notes,
    Value<int?>? inventoryCount,
  }) {
    return MedicineEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      strength: strength ?? this.strength,
      instructions: instructions ?? this.instructions,
      notes: notes ?? this.notes,
      inventoryCount: inventoryCount ?? this.inventoryCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (strength.present) {
      map['strength'] = Variable<String>(strength.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (inventoryCount.present) {
      map['inventory_count'] = Variable<int>(inventoryCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('strength: $strength, ')
          ..write('instructions: $instructions, ')
          ..write('notes: $notes, ')
          ..write('inventoryCount: $inventoryCount')
          ..write(')'))
        .toString();
  }
}

class $SchedulesEntityTable extends SchedulesEntity
    with TableInfo<$SchedulesEntityTable, SchedulesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<int> medicineId = GeneratedColumn<int>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicine_table (id)',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repeatPatternMeta = const VerificationMeta(
    'repeatPattern',
  );
  @override
  late final GeneratedColumn<String> repeatPattern = GeneratedColumn<String>(
    'repeat_pattern',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekdaysMeta = const VerificationMeta(
    'weekdays',
  );
  @override
  late final GeneratedColumn<String> weekdays = GeneratedColumn<String>(
    'weekdays',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    medicineId,
    startDate,
    endDate,
    repeatPattern,
    weekdays,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedules_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchedulesEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('repeat_pattern')) {
      context.handle(
        _repeatPatternMeta,
        repeatPattern.isAcceptableOrUnknown(
          data['repeat_pattern']!,
          _repeatPatternMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_repeatPatternMeta);
    }
    if (data.containsKey('weekdays')) {
      context.handle(
        _weekdaysMeta,
        weekdays.isAcceptableOrUnknown(data['weekdays']!, _weekdaysMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchedulesEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchedulesEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medicine_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      repeatPattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repeat_pattern'],
      )!,
      weekdays: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weekdays'],
      ),
    );
  }

  @override
  $SchedulesEntityTable createAlias(String alias) {
    return $SchedulesEntityTable(attachedDatabase, alias);
  }
}

class SchedulesEntityData extends DataClass
    implements Insertable<SchedulesEntityData> {
  final int id;
  final int medicineId;
  final DateTime startDate;
  final DateTime? endDate;
  final String repeatPattern;
  final String? weekdays;
  const SchedulesEntityData({
    required this.id,
    required this.medicineId,
    required this.startDate,
    this.endDate,
    required this.repeatPattern,
    this.weekdays,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medicine_id'] = Variable<int>(medicineId);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['repeat_pattern'] = Variable<String>(repeatPattern);
    if (!nullToAbsent || weekdays != null) {
      map['weekdays'] = Variable<String>(weekdays);
    }
    return map;
  }

  SchedulesEntityCompanion toCompanion(bool nullToAbsent) {
    return SchedulesEntityCompanion(
      id: Value(id),
      medicineId: Value(medicineId),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      repeatPattern: Value(repeatPattern),
      weekdays: weekdays == null && nullToAbsent
          ? const Value.absent()
          : Value(weekdays),
    );
  }

  factory SchedulesEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchedulesEntityData(
      id: serializer.fromJson<int>(json['id']),
      medicineId: serializer.fromJson<int>(json['medicineId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      repeatPattern: serializer.fromJson<String>(json['repeatPattern']),
      weekdays: serializer.fromJson<String?>(json['weekdays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicineId': serializer.toJson<int>(medicineId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'repeatPattern': serializer.toJson<String>(repeatPattern),
      'weekdays': serializer.toJson<String?>(weekdays),
    };
  }

  SchedulesEntityData copyWith({
    int? id,
    int? medicineId,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    String? repeatPattern,
    Value<String?> weekdays = const Value.absent(),
  }) => SchedulesEntityData(
    id: id ?? this.id,
    medicineId: medicineId ?? this.medicineId,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    repeatPattern: repeatPattern ?? this.repeatPattern,
    weekdays: weekdays.present ? weekdays.value : this.weekdays,
  );
  SchedulesEntityData copyWithCompanion(SchedulesEntityCompanion data) {
    return SchedulesEntityData(
      id: data.id.present ? data.id.value : this.id,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      repeatPattern: data.repeatPattern.present
          ? data.repeatPattern.value
          : this.repeatPattern,
      weekdays: data.weekdays.present ? data.weekdays.value : this.weekdays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesEntityData(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('repeatPattern: $repeatPattern, ')
          ..write('weekdays: $weekdays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, medicineId, startDate, endDate, repeatPattern, weekdays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchedulesEntityData &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.repeatPattern == this.repeatPattern &&
          other.weekdays == this.weekdays);
}

class SchedulesEntityCompanion extends UpdateCompanion<SchedulesEntityData> {
  final Value<int> id;
  final Value<int> medicineId;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String> repeatPattern;
  final Value<String?> weekdays;
  const SchedulesEntityCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.repeatPattern = const Value.absent(),
    this.weekdays = const Value.absent(),
  });
  SchedulesEntityCompanion.insert({
    this.id = const Value.absent(),
    required int medicineId,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    required String repeatPattern,
    this.weekdays = const Value.absent(),
  }) : medicineId = Value(medicineId),
       startDate = Value(startDate),
       repeatPattern = Value(repeatPattern);
  static Insertable<SchedulesEntityData> custom({
    Expression<int>? id,
    Expression<int>? medicineId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? repeatPattern,
    Expression<String>? weekdays,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (repeatPattern != null) 'repeat_pattern': repeatPattern,
      if (weekdays != null) 'weekdays': weekdays,
    });
  }

  SchedulesEntityCompanion copyWith({
    Value<int>? id,
    Value<int>? medicineId,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<String>? repeatPattern,
    Value<String?>? weekdays,
  }) {
    return SchedulesEntityCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      repeatPattern: repeatPattern ?? this.repeatPattern,
      weekdays: weekdays ?? this.weekdays,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (repeatPattern.present) {
      map['repeat_pattern'] = Variable<String>(repeatPattern.value);
    }
    if (weekdays.present) {
      map['weekdays'] = Variable<String>(weekdays.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesEntityCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('repeatPattern: $repeatPattern, ')
          ..write('weekdays: $weekdays')
          ..write(')'))
        .toString();
  }
}

class $IntakeLogsEntityTable extends IntakeLogsEntity
    with TableInfo<$IntakeLogsEntityTable, IntakeLogsEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntakeLogsEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _scheduleIdMeta = const VerificationMeta(
    'scheduleId',
  );
  @override
  late final GeneratedColumn<int> scheduleId = GeneratedColumn<int>(
    'schedule_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schedules_entity (id)',
    ),
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<int> medicineId = GeneratedColumn<int>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicine_table (id)',
    ),
  );
  static const VerificationMeta _intendedTimeMeta = const VerificationMeta(
    'intendedTime',
  );
  @override
  late final GeneratedColumn<DateTime> intendedTime = GeneratedColumn<DateTime>(
    'intended_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualTimeMeta = const VerificationMeta(
    'actualTime',
  );
  @override
  late final GeneratedColumn<DateTime> actualTime = GeneratedColumn<DateTime>(
    'actual_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    scheduleId,
    medicineId,
    intendedTime,
    actualTime,
    status,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intake_logs_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<IntakeLogsEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('schedule_id')) {
      context.handle(
        _scheduleIdMeta,
        scheduleId.isAcceptableOrUnknown(data['schedule_id']!, _scheduleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_scheduleIdMeta);
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('intended_time')) {
      context.handle(
        _intendedTimeMeta,
        intendedTime.isAcceptableOrUnknown(
          data['intended_time']!,
          _intendedTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_intendedTimeMeta);
    }
    if (data.containsKey('actual_time')) {
      context.handle(
        _actualTimeMeta,
        actualTime.isAcceptableOrUnknown(data['actual_time']!, _actualTimeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IntakeLogsEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IntakeLogsEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      scheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schedule_id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medicine_id'],
      )!,
      intendedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}intended_time'],
      )!,
      actualTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actual_time'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $IntakeLogsEntityTable createAlias(String alias) {
    return $IntakeLogsEntityTable(attachedDatabase, alias);
  }
}

class IntakeLogsEntityData extends DataClass
    implements Insertable<IntakeLogsEntityData> {
  final int id;
  final int scheduleId;
  final int medicineId;
  final DateTime intendedTime;
  final DateTime? actualTime;
  final String status;
  final String? note;
  const IntakeLogsEntityData({
    required this.id,
    required this.scheduleId,
    required this.medicineId,
    required this.intendedTime,
    this.actualTime,
    required this.status,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['schedule_id'] = Variable<int>(scheduleId);
    map['medicine_id'] = Variable<int>(medicineId);
    map['intended_time'] = Variable<DateTime>(intendedTime);
    if (!nullToAbsent || actualTime != null) {
      map['actual_time'] = Variable<DateTime>(actualTime);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  IntakeLogsEntityCompanion toCompanion(bool nullToAbsent) {
    return IntakeLogsEntityCompanion(
      id: Value(id),
      scheduleId: Value(scheduleId),
      medicineId: Value(medicineId),
      intendedTime: Value(intendedTime),
      actualTime: actualTime == null && nullToAbsent
          ? const Value.absent()
          : Value(actualTime),
      status: Value(status),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory IntakeLogsEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IntakeLogsEntityData(
      id: serializer.fromJson<int>(json['id']),
      scheduleId: serializer.fromJson<int>(json['scheduleId']),
      medicineId: serializer.fromJson<int>(json['medicineId']),
      intendedTime: serializer.fromJson<DateTime>(json['intendedTime']),
      actualTime: serializer.fromJson<DateTime?>(json['actualTime']),
      status: serializer.fromJson<String>(json['status']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'scheduleId': serializer.toJson<int>(scheduleId),
      'medicineId': serializer.toJson<int>(medicineId),
      'intendedTime': serializer.toJson<DateTime>(intendedTime),
      'actualTime': serializer.toJson<DateTime?>(actualTime),
      'status': serializer.toJson<String>(status),
      'note': serializer.toJson<String?>(note),
    };
  }

  IntakeLogsEntityData copyWith({
    int? id,
    int? scheduleId,
    int? medicineId,
    DateTime? intendedTime,
    Value<DateTime?> actualTime = const Value.absent(),
    String? status,
    Value<String?> note = const Value.absent(),
  }) => IntakeLogsEntityData(
    id: id ?? this.id,
    scheduleId: scheduleId ?? this.scheduleId,
    medicineId: medicineId ?? this.medicineId,
    intendedTime: intendedTime ?? this.intendedTime,
    actualTime: actualTime.present ? actualTime.value : this.actualTime,
    status: status ?? this.status,
    note: note.present ? note.value : this.note,
  );
  IntakeLogsEntityData copyWithCompanion(IntakeLogsEntityCompanion data) {
    return IntakeLogsEntityData(
      id: data.id.present ? data.id.value : this.id,
      scheduleId: data.scheduleId.present
          ? data.scheduleId.value
          : this.scheduleId,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      intendedTime: data.intendedTime.present
          ? data.intendedTime.value
          : this.intendedTime,
      actualTime: data.actualTime.present
          ? data.actualTime.value
          : this.actualTime,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IntakeLogsEntityData(')
          ..write('id: $id, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('medicineId: $medicineId, ')
          ..write('intendedTime: $intendedTime, ')
          ..write('actualTime: $actualTime, ')
          ..write('status: $status, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    scheduleId,
    medicineId,
    intendedTime,
    actualTime,
    status,
    note,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IntakeLogsEntityData &&
          other.id == this.id &&
          other.scheduleId == this.scheduleId &&
          other.medicineId == this.medicineId &&
          other.intendedTime == this.intendedTime &&
          other.actualTime == this.actualTime &&
          other.status == this.status &&
          other.note == this.note);
}

class IntakeLogsEntityCompanion extends UpdateCompanion<IntakeLogsEntityData> {
  final Value<int> id;
  final Value<int> scheduleId;
  final Value<int> medicineId;
  final Value<DateTime> intendedTime;
  final Value<DateTime?> actualTime;
  final Value<String> status;
  final Value<String?> note;
  const IntakeLogsEntityCompanion({
    this.id = const Value.absent(),
    this.scheduleId = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.intendedTime = const Value.absent(),
    this.actualTime = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
  });
  IntakeLogsEntityCompanion.insert({
    this.id = const Value.absent(),
    required int scheduleId,
    required int medicineId,
    required DateTime intendedTime,
    this.actualTime = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
  }) : scheduleId = Value(scheduleId),
       medicineId = Value(medicineId),
       intendedTime = Value(intendedTime);
  static Insertable<IntakeLogsEntityData> custom({
    Expression<int>? id,
    Expression<int>? scheduleId,
    Expression<int>? medicineId,
    Expression<DateTime>? intendedTime,
    Expression<DateTime>? actualTime,
    Expression<String>? status,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scheduleId != null) 'schedule_id': scheduleId,
      if (medicineId != null) 'medicine_id': medicineId,
      if (intendedTime != null) 'intended_time': intendedTime,
      if (actualTime != null) 'actual_time': actualTime,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
    });
  }

  IntakeLogsEntityCompanion copyWith({
    Value<int>? id,
    Value<int>? scheduleId,
    Value<int>? medicineId,
    Value<DateTime>? intendedTime,
    Value<DateTime?>? actualTime,
    Value<String>? status,
    Value<String?>? note,
  }) {
    return IntakeLogsEntityCompanion(
      id: id ?? this.id,
      scheduleId: scheduleId ?? this.scheduleId,
      medicineId: medicineId ?? this.medicineId,
      intendedTime: intendedTime ?? this.intendedTime,
      actualTime: actualTime ?? this.actualTime,
      status: status ?? this.status,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (scheduleId.present) {
      map['schedule_id'] = Variable<int>(scheduleId.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (intendedTime.present) {
      map['intended_time'] = Variable<DateTime>(intendedTime.value);
    }
    if (actualTime.present) {
      map['actual_time'] = Variable<DateTime>(actualTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntakeLogsEntityCompanion(')
          ..write('id: $id, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('medicineId: $medicineId, ')
          ..write('intendedTime: $intendedTime, ')
          ..write('actualTime: $actualTime, ')
          ..write('status: $status, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $RefillRemindersEntityTable extends RefillRemindersEntity
    with TableInfo<$RefillRemindersEntityTable, RefillRemindersEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RefillRemindersEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<int> medicineId = GeneratedColumn<int>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES medicine_table (id)',
    ),
  );
  static const VerificationMeta _thresholdMeta = const VerificationMeta(
    'threshold',
  );
  @override
  late final GeneratedColumn<int> threshold = GeneratedColumn<int>(
    'threshold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notifiedMeta = const VerificationMeta(
    'notified',
  );
  @override
  late final GeneratedColumn<bool> notified = GeneratedColumn<bool>(
    'notified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, medicineId, threshold, notified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'refill_reminders_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<RefillRemindersEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('threshold')) {
      context.handle(
        _thresholdMeta,
        threshold.isAcceptableOrUnknown(data['threshold']!, _thresholdMeta),
      );
    } else if (isInserting) {
      context.missing(_thresholdMeta);
    }
    if (data.containsKey('notified')) {
      context.handle(
        _notifiedMeta,
        notified.isAcceptableOrUnknown(data['notified']!, _notifiedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RefillRemindersEntityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RefillRemindersEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medicine_id'],
      )!,
      threshold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}threshold'],
      )!,
      notified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notified'],
      )!,
    );
  }

  @override
  $RefillRemindersEntityTable createAlias(String alias) {
    return $RefillRemindersEntityTable(attachedDatabase, alias);
  }
}

class RefillRemindersEntityData extends DataClass
    implements Insertable<RefillRemindersEntityData> {
  final int id;
  final int medicineId;
  final int threshold;
  final bool notified;
  const RefillRemindersEntityData({
    required this.id,
    required this.medicineId,
    required this.threshold,
    required this.notified,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medicine_id'] = Variable<int>(medicineId);
    map['threshold'] = Variable<int>(threshold);
    map['notified'] = Variable<bool>(notified);
    return map;
  }

  RefillRemindersEntityCompanion toCompanion(bool nullToAbsent) {
    return RefillRemindersEntityCompanion(
      id: Value(id),
      medicineId: Value(medicineId),
      threshold: Value(threshold),
      notified: Value(notified),
    );
  }

  factory RefillRemindersEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RefillRemindersEntityData(
      id: serializer.fromJson<int>(json['id']),
      medicineId: serializer.fromJson<int>(json['medicineId']),
      threshold: serializer.fromJson<int>(json['threshold']),
      notified: serializer.fromJson<bool>(json['notified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicineId': serializer.toJson<int>(medicineId),
      'threshold': serializer.toJson<int>(threshold),
      'notified': serializer.toJson<bool>(notified),
    };
  }

  RefillRemindersEntityData copyWith({
    int? id,
    int? medicineId,
    int? threshold,
    bool? notified,
  }) => RefillRemindersEntityData(
    id: id ?? this.id,
    medicineId: medicineId ?? this.medicineId,
    threshold: threshold ?? this.threshold,
    notified: notified ?? this.notified,
  );
  RefillRemindersEntityData copyWithCompanion(
    RefillRemindersEntityCompanion data,
  ) {
    return RefillRemindersEntityData(
      id: data.id.present ? data.id.value : this.id,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      threshold: data.threshold.present ? data.threshold.value : this.threshold,
      notified: data.notified.present ? data.notified.value : this.notified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RefillRemindersEntityData(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('threshold: $threshold, ')
          ..write('notified: $notified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicineId, threshold, notified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RefillRemindersEntityData &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.threshold == this.threshold &&
          other.notified == this.notified);
}

class RefillRemindersEntityCompanion
    extends UpdateCompanion<RefillRemindersEntityData> {
  final Value<int> id;
  final Value<int> medicineId;
  final Value<int> threshold;
  final Value<bool> notified;
  const RefillRemindersEntityCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.threshold = const Value.absent(),
    this.notified = const Value.absent(),
  });
  RefillRemindersEntityCompanion.insert({
    this.id = const Value.absent(),
    required int medicineId,
    required int threshold,
    this.notified = const Value.absent(),
  }) : medicineId = Value(medicineId),
       threshold = Value(threshold);
  static Insertable<RefillRemindersEntityData> custom({
    Expression<int>? id,
    Expression<int>? medicineId,
    Expression<int>? threshold,
    Expression<bool>? notified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (threshold != null) 'threshold': threshold,
      if (notified != null) 'notified': notified,
    });
  }

  RefillRemindersEntityCompanion copyWith({
    Value<int>? id,
    Value<int>? medicineId,
    Value<int>? threshold,
    Value<bool>? notified,
  }) {
    return RefillRemindersEntityCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      threshold: threshold ?? this.threshold,
      notified: notified ?? this.notified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (threshold.present) {
      map['threshold'] = Variable<int>(threshold.value);
    }
    if (notified.present) {
      map['notified'] = Variable<bool>(notified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RefillRemindersEntityCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('threshold: $threshold, ')
          ..write('notified: $notified')
          ..write(')'))
        .toString();
  }
}

class $ReminderTimesEntityTable extends ReminderTimesEntity
    with TableInfo<$ReminderTimesEntityTable, ReminderTimesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderTimesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _scheduleIdMeta = const VerificationMeta(
    'scheduleId',
  );
  @override
  late final GeneratedColumn<int> scheduleId = GeneratedColumn<int>(
    'schedule_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES schedules_entity (id)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, scheduleId, time, enabled];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_times_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderTimesEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('schedule_id')) {
      context.handle(
        _scheduleIdMeta,
        scheduleId.isAcceptableOrUnknown(data['schedule_id']!, _scheduleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_scheduleIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderTimesEntityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderTimesEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      scheduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}schedule_id'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
    );
  }

  @override
  $ReminderTimesEntityTable createAlias(String alias) {
    return $ReminderTimesEntityTable(attachedDatabase, alias);
  }
}

class ReminderTimesEntityData extends DataClass
    implements Insertable<ReminderTimesEntityData> {
  final int id;
  final int scheduleId;
  final String time;
  final bool enabled;
  const ReminderTimesEntityData({
    required this.id,
    required this.scheduleId,
    required this.time,
    required this.enabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['schedule_id'] = Variable<int>(scheduleId);
    map['time'] = Variable<String>(time);
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  ReminderTimesEntityCompanion toCompanion(bool nullToAbsent) {
    return ReminderTimesEntityCompanion(
      id: Value(id),
      scheduleId: Value(scheduleId),
      time: Value(time),
      enabled: Value(enabled),
    );
  }

  factory ReminderTimesEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderTimesEntityData(
      id: serializer.fromJson<int>(json['id']),
      scheduleId: serializer.fromJson<int>(json['scheduleId']),
      time: serializer.fromJson<String>(json['time']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'scheduleId': serializer.toJson<int>(scheduleId),
      'time': serializer.toJson<String>(time),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  ReminderTimesEntityData copyWith({
    int? id,
    int? scheduleId,
    String? time,
    bool? enabled,
  }) => ReminderTimesEntityData(
    id: id ?? this.id,
    scheduleId: scheduleId ?? this.scheduleId,
    time: time ?? this.time,
    enabled: enabled ?? this.enabled,
  );
  ReminderTimesEntityData copyWithCompanion(ReminderTimesEntityCompanion data) {
    return ReminderTimesEntityData(
      id: data.id.present ? data.id.value : this.id,
      scheduleId: data.scheduleId.present
          ? data.scheduleId.value
          : this.scheduleId,
      time: data.time.present ? data.time.value : this.time,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTimesEntityData(')
          ..write('id: $id, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('time: $time, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, scheduleId, time, enabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderTimesEntityData &&
          other.id == this.id &&
          other.scheduleId == this.scheduleId &&
          other.time == this.time &&
          other.enabled == this.enabled);
}

class ReminderTimesEntityCompanion
    extends UpdateCompanion<ReminderTimesEntityData> {
  final Value<int> id;
  final Value<int> scheduleId;
  final Value<String> time;
  final Value<bool> enabled;
  const ReminderTimesEntityCompanion({
    this.id = const Value.absent(),
    this.scheduleId = const Value.absent(),
    this.time = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  ReminderTimesEntityCompanion.insert({
    this.id = const Value.absent(),
    required int scheduleId,
    required String time,
    this.enabled = const Value.absent(),
  }) : scheduleId = Value(scheduleId),
       time = Value(time);
  static Insertable<ReminderTimesEntityData> custom({
    Expression<int>? id,
    Expression<int>? scheduleId,
    Expression<String>? time,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scheduleId != null) 'schedule_id': scheduleId,
      if (time != null) 'time': time,
      if (enabled != null) 'enabled': enabled,
    });
  }

  ReminderTimesEntityCompanion copyWith({
    Value<int>? id,
    Value<int>? scheduleId,
    Value<String>? time,
    Value<bool>? enabled,
  }) {
    return ReminderTimesEntityCompanion(
      id: id ?? this.id,
      scheduleId: scheduleId ?? this.scheduleId,
      time: time ?? this.time,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (scheduleId.present) {
      map['schedule_id'] = Variable<int>(scheduleId.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTimesEntityCompanion(')
          ..write('id: $id, ')
          ..write('scheduleId: $scheduleId, ')
          ..write('time: $time, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $SnoozesEntityTable extends SnoozesEntity
    with TableInfo<$SnoozesEntityTable, SnoozesEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SnoozesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _intakeLogIdMeta = const VerificationMeta(
    'intakeLogId',
  );
  @override
  late final GeneratedColumn<int> intakeLogId = GeneratedColumn<int>(
    'intake_log_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES intake_logs_entity (id)',
    ),
  );
  static const VerificationMeta _snoozedUntilMeta = const VerificationMeta(
    'snoozedUntil',
  );
  @override
  late final GeneratedColumn<DateTime> snoozedUntil = GeneratedColumn<DateTime>(
    'snoozed_until',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, intakeLogId, snoozedUntil];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'snoozes_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<SnoozesEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('intake_log_id')) {
      context.handle(
        _intakeLogIdMeta,
        intakeLogId.isAcceptableOrUnknown(
          data['intake_log_id']!,
          _intakeLogIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_intakeLogIdMeta);
    }
    if (data.containsKey('snoozed_until')) {
      context.handle(
        _snoozedUntilMeta,
        snoozedUntil.isAcceptableOrUnknown(
          data['snoozed_until']!,
          _snoozedUntilMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_snoozedUntilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SnoozesEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SnoozesEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      intakeLogId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intake_log_id'],
      )!,
      snoozedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snoozed_until'],
      )!,
    );
  }

  @override
  $SnoozesEntityTable createAlias(String alias) {
    return $SnoozesEntityTable(attachedDatabase, alias);
  }
}

class SnoozesEntityData extends DataClass
    implements Insertable<SnoozesEntityData> {
  final int id;
  final int intakeLogId;
  final DateTime snoozedUntil;
  const SnoozesEntityData({
    required this.id,
    required this.intakeLogId,
    required this.snoozedUntil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['intake_log_id'] = Variable<int>(intakeLogId);
    map['snoozed_until'] = Variable<DateTime>(snoozedUntil);
    return map;
  }

  SnoozesEntityCompanion toCompanion(bool nullToAbsent) {
    return SnoozesEntityCompanion(
      id: Value(id),
      intakeLogId: Value(intakeLogId),
      snoozedUntil: Value(snoozedUntil),
    );
  }

  factory SnoozesEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SnoozesEntityData(
      id: serializer.fromJson<int>(json['id']),
      intakeLogId: serializer.fromJson<int>(json['intakeLogId']),
      snoozedUntil: serializer.fromJson<DateTime>(json['snoozedUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'intakeLogId': serializer.toJson<int>(intakeLogId),
      'snoozedUntil': serializer.toJson<DateTime>(snoozedUntil),
    };
  }

  SnoozesEntityData copyWith({
    int? id,
    int? intakeLogId,
    DateTime? snoozedUntil,
  }) => SnoozesEntityData(
    id: id ?? this.id,
    intakeLogId: intakeLogId ?? this.intakeLogId,
    snoozedUntil: snoozedUntil ?? this.snoozedUntil,
  );
  SnoozesEntityData copyWithCompanion(SnoozesEntityCompanion data) {
    return SnoozesEntityData(
      id: data.id.present ? data.id.value : this.id,
      intakeLogId: data.intakeLogId.present
          ? data.intakeLogId.value
          : this.intakeLogId,
      snoozedUntil: data.snoozedUntil.present
          ? data.snoozedUntil.value
          : this.snoozedUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SnoozesEntityData(')
          ..write('id: $id, ')
          ..write('intakeLogId: $intakeLogId, ')
          ..write('snoozedUntil: $snoozedUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, intakeLogId, snoozedUntil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SnoozesEntityData &&
          other.id == this.id &&
          other.intakeLogId == this.intakeLogId &&
          other.snoozedUntil == this.snoozedUntil);
}

class SnoozesEntityCompanion extends UpdateCompanion<SnoozesEntityData> {
  final Value<int> id;
  final Value<int> intakeLogId;
  final Value<DateTime> snoozedUntil;
  const SnoozesEntityCompanion({
    this.id = const Value.absent(),
    this.intakeLogId = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
  });
  SnoozesEntityCompanion.insert({
    this.id = const Value.absent(),
    required int intakeLogId,
    required DateTime snoozedUntil,
  }) : intakeLogId = Value(intakeLogId),
       snoozedUntil = Value(snoozedUntil);
  static Insertable<SnoozesEntityData> custom({
    Expression<int>? id,
    Expression<int>? intakeLogId,
    Expression<DateTime>? snoozedUntil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (intakeLogId != null) 'intake_log_id': intakeLogId,
      if (snoozedUntil != null) 'snoozed_until': snoozedUntil,
    });
  }

  SnoozesEntityCompanion copyWith({
    Value<int>? id,
    Value<int>? intakeLogId,
    Value<DateTime>? snoozedUntil,
  }) {
    return SnoozesEntityCompanion(
      id: id ?? this.id,
      intakeLogId: intakeLogId ?? this.intakeLogId,
      snoozedUntil: snoozedUntil ?? this.snoozedUntil,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (intakeLogId.present) {
      map['intake_log_id'] = Variable<int>(intakeLogId.value);
    }
    if (snoozedUntil.present) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SnoozesEntityCompanion(')
          ..write('id: $id, ')
          ..write('intakeLogId: $intakeLogId, ')
          ..write('snoozedUntil: $snoozedUntil')
          ..write(')'))
        .toString();
  }
}

class $UserEntityTable extends UserEntity
    with TableInfo<$UserEntityTable, UserEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _allergiesMeta = const VerificationMeta(
    'allergies',
  );
  @override
  late final GeneratedColumn<String> allergies = GeneratedColumn<String>(
    'allergies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicalNotesMeta = const VerificationMeta(
    'medicalNotes',
  );
  @override
  late final GeneratedColumn<String> medicalNotes = GeneratedColumn<String>(
    'medical_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    age,
    gender,
    weight,
    allergies,
    medicalNotes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('allergies')) {
      context.handle(
        _allergiesMeta,
        allergies.isAcceptableOrUnknown(data['allergies']!, _allergiesMeta),
      );
    }
    if (data.containsKey('medical_notes')) {
      context.handle(
        _medicalNotesMeta,
        medicalNotes.isAcceptableOrUnknown(
          data['medical_notes']!,
          _medicalNotesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      allergies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}allergies'],
      ),
      medicalNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medical_notes'],
      ),
    );
  }

  @override
  $UserEntityTable createAlias(String alias) {
    return $UserEntityTable(attachedDatabase, alias);
  }
}

class UserEntityData extends DataClass implements Insertable<UserEntityData> {
  final int id;
  final String name;
  final int? age;
  final String? gender;
  final double? weight;
  final String? allergies;
  final String? medicalNotes;
  const UserEntityData({
    required this.id,
    required this.name,
    this.age,
    this.gender,
    this.weight,
    this.allergies,
    this.medicalNotes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || allergies != null) {
      map['allergies'] = Variable<String>(allergies);
    }
    if (!nullToAbsent || medicalNotes != null) {
      map['medical_notes'] = Variable<String>(medicalNotes);
    }
    return map;
  }

  UserEntityCompanion toCompanion(bool nullToAbsent) {
    return UserEntityCompanion(
      id: Value(id),
      name: Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      allergies: allergies == null && nullToAbsent
          ? const Value.absent()
          : Value(allergies),
      medicalNotes: medicalNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(medicalNotes),
    );
  }

  factory UserEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int?>(json['age']),
      gender: serializer.fromJson<String?>(json['gender']),
      weight: serializer.fromJson<double?>(json['weight']),
      allergies: serializer.fromJson<String?>(json['allergies']),
      medicalNotes: serializer.fromJson<String?>(json['medicalNotes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int?>(age),
      'gender': serializer.toJson<String?>(gender),
      'weight': serializer.toJson<double?>(weight),
      'allergies': serializer.toJson<String?>(allergies),
      'medicalNotes': serializer.toJson<String?>(medicalNotes),
    };
  }

  UserEntityData copyWith({
    int? id,
    String? name,
    Value<int?> age = const Value.absent(),
    Value<String?> gender = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<String?> allergies = const Value.absent(),
    Value<String?> medicalNotes = const Value.absent(),
  }) => UserEntityData(
    id: id ?? this.id,
    name: name ?? this.name,
    age: age.present ? age.value : this.age,
    gender: gender.present ? gender.value : this.gender,
    weight: weight.present ? weight.value : this.weight,
    allergies: allergies.present ? allergies.value : this.allergies,
    medicalNotes: medicalNotes.present ? medicalNotes.value : this.medicalNotes,
  );
  UserEntityData copyWithCompanion(UserEntityCompanion data) {
    return UserEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      gender: data.gender.present ? data.gender.value : this.gender,
      weight: data.weight.present ? data.weight.value : this.weight,
      allergies: data.allergies.present ? data.allergies.value : this.allergies,
      medicalNotes: data.medicalNotes.present
          ? data.medicalNotes.value
          : this.medicalNotes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('weight: $weight, ')
          ..write('allergies: $allergies, ')
          ..write('medicalNotes: $medicalNotes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, age, gender, weight, allergies, medicalNotes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.weight == this.weight &&
          other.allergies == this.allergies &&
          other.medicalNotes == this.medicalNotes);
}

class UserEntityCompanion extends UpdateCompanion<UserEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> age;
  final Value<String?> gender;
  final Value<double?> weight;
  final Value<String?> allergies;
  final Value<String?> medicalNotes;
  const UserEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.weight = const Value.absent(),
    this.allergies = const Value.absent(),
    this.medicalNotes = const Value.absent(),
  });
  UserEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.weight = const Value.absent(),
    this.allergies = const Value.absent(),
    this.medicalNotes = const Value.absent(),
  }) : name = Value(name);
  static Insertable<UserEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? gender,
    Expression<double>? weight,
    Expression<String>? allergies,
    Expression<String>? medicalNotes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (weight != null) 'weight': weight,
      if (allergies != null) 'allergies': allergies,
      if (medicalNotes != null) 'medical_notes': medicalNotes,
    });
  }

  UserEntityCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? age,
    Value<String?>? gender,
    Value<double?>? weight,
    Value<String?>? allergies,
    Value<String?>? medicalNotes,
  }) {
    return UserEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      allergies: allergies ?? this.allergies,
      medicalNotes: medicalNotes ?? this.medicalNotes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (allergies.present) {
      map['allergies'] = Variable<String>(allergies.value);
    }
    if (medicalNotes.present) {
      map['medical_notes'] = Variable<String>(medicalNotes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('weight: $weight, ')
          ..write('allergies: $allergies, ')
          ..write('medicalNotes: $medicalNotes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MedicineEntityTable medicineEntity = $MedicineEntityTable(this);
  late final $SchedulesEntityTable schedulesEntity = $SchedulesEntityTable(
    this,
  );
  late final $IntakeLogsEntityTable intakeLogsEntity = $IntakeLogsEntityTable(
    this,
  );
  late final $RefillRemindersEntityTable refillRemindersEntity =
      $RefillRemindersEntityTable(this);
  late final $ReminderTimesEntityTable reminderTimesEntity =
      $ReminderTimesEntityTable(this);
  late final $SnoozesEntityTable snoozesEntity = $SnoozesEntityTable(this);
  late final $UserEntityTable userEntity = $UserEntityTable(this);
  late final IntakeLogsDao intakeLogsDao = IntakeLogsDao(this as AppDatabase);
  late final MedicinesDao medicinesDao = MedicinesDao(this as AppDatabase);
  late final RefillRemindersDao refillRemindersDao = RefillRemindersDao(
    this as AppDatabase,
  );
  late final ReminderTimesDao reminderTimesDao = ReminderTimesDao(
    this as AppDatabase,
  );
  late final SchedulesDao schedulesDao = SchedulesDao(this as AppDatabase);
  late final SnoozesDao snoozesDao = SnoozesDao(this as AppDatabase);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    medicineEntity,
    schedulesEntity,
    intakeLogsEntity,
    refillRemindersEntity,
    reminderTimesEntity,
    snoozesEntity,
    userEntity,
  ];
}

typedef $$MedicineEntityTableCreateCompanionBuilder =
    MedicineEntityCompanion Function({
      Value<int> id,
      required String name,
      required String type,
      Value<String?> strength,
      Value<String?> instructions,
      Value<String?> notes,
      Value<int?> inventoryCount,
    });
typedef $$MedicineEntityTableUpdateCompanionBuilder =
    MedicineEntityCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> type,
      Value<String?> strength,
      Value<String?> instructions,
      Value<String?> notes,
      Value<int?> inventoryCount,
    });

final class $$MedicineEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MedicineEntityTable,
          MedicineEntityData
        > {
  $$MedicineEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SchedulesEntityTable, List<SchedulesEntityData>>
  _schedulesEntityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.schedulesEntity,
    aliasName: $_aliasNameGenerator(
      db.medicineEntity.id,
      db.schedulesEntity.medicineId,
    ),
  );

  $$SchedulesEntityTableProcessedTableManager get schedulesEntityRefs {
    final manager = $$SchedulesEntityTableTableManager(
      $_db,
      $_db.schedulesEntity,
    ).filter((f) => f.medicineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _schedulesEntityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$IntakeLogsEntityTable, List<IntakeLogsEntityData>>
  _intakeLogsEntityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.intakeLogsEntity,
    aliasName: $_aliasNameGenerator(
      db.medicineEntity.id,
      db.intakeLogsEntity.medicineId,
    ),
  );

  $$IntakeLogsEntityTableProcessedTableManager get intakeLogsEntityRefs {
    final manager = $$IntakeLogsEntityTableTableManager(
      $_db,
      $_db.intakeLogsEntity,
    ).filter((f) => f.medicineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _intakeLogsEntityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RefillRemindersEntityTable,
    List<RefillRemindersEntityData>
  >
  _refillRemindersEntityRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.refillRemindersEntity,
        aliasName: $_aliasNameGenerator(
          db.medicineEntity.id,
          db.refillRemindersEntity.medicineId,
        ),
      );

  $$RefillRemindersEntityTableProcessedTableManager
  get refillRemindersEntityRefs {
    final manager = $$RefillRemindersEntityTableTableManager(
      $_db,
      $_db.refillRemindersEntity,
    ).filter((f) => f.medicineId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _refillRemindersEntityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MedicineEntityTableFilterComposer
    extends Composer<_$AppDatabase, $MedicineEntityTable> {
  $$MedicineEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get inventoryCount => $composableBuilder(
    column: $table.inventoryCount,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> schedulesEntityRefs(
    Expression<bool> Function($$SchedulesEntityTableFilterComposer f) f,
  ) {
    final $$SchedulesEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableFilterComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> intakeLogsEntityRefs(
    Expression<bool> Function($$IntakeLogsEntityTableFilterComposer f) f,
  ) {
    final $$IntakeLogsEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableFilterComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> refillRemindersEntityRefs(
    Expression<bool> Function($$RefillRemindersEntityTableFilterComposer f) f,
  ) {
    final $$RefillRemindersEntityTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.refillRemindersEntity,
          getReferencedColumn: (t) => t.medicineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RefillRemindersEntityTableFilterComposer(
                $db: $db,
                $table: $db.refillRemindersEntity,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MedicineEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicineEntityTable> {
  $$MedicineEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get inventoryCount => $composableBuilder(
    column: $table.inventoryCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicineEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicineEntityTable> {
  $$MedicineEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get inventoryCount => $composableBuilder(
    column: $table.inventoryCount,
    builder: (column) => column,
  );

  Expression<T> schedulesEntityRefs<T extends Object>(
    Expression<T> Function($$SchedulesEntityTableAnnotationComposer a) f,
  ) {
    final $$SchedulesEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> intakeLogsEntityRefs<T extends Object>(
    Expression<T> Function($$IntakeLogsEntityTableAnnotationComposer a) f,
  ) {
    final $$IntakeLogsEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.medicineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> refillRemindersEntityRefs<T extends Object>(
    Expression<T> Function($$RefillRemindersEntityTableAnnotationComposer a) f,
  ) {
    final $$RefillRemindersEntityTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.refillRemindersEntity,
          getReferencedColumn: (t) => t.medicineId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RefillRemindersEntityTableAnnotationComposer(
                $db: $db,
                $table: $db.refillRemindersEntity,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MedicineEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicineEntityTable,
          MedicineEntityData,
          $$MedicineEntityTableFilterComposer,
          $$MedicineEntityTableOrderingComposer,
          $$MedicineEntityTableAnnotationComposer,
          $$MedicineEntityTableCreateCompanionBuilder,
          $$MedicineEntityTableUpdateCompanionBuilder,
          (MedicineEntityData, $$MedicineEntityTableReferences),
          MedicineEntityData,
          PrefetchHooks Function({
            bool schedulesEntityRefs,
            bool intakeLogsEntityRefs,
            bool refillRemindersEntityRefs,
          })
        > {
  $$MedicineEntityTableTableManager(
    _$AppDatabase db,
    $MedicineEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicineEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicineEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicineEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> strength = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> inventoryCount = const Value.absent(),
              }) => MedicineEntityCompanion(
                id: id,
                name: name,
                type: type,
                strength: strength,
                instructions: instructions,
                notes: notes,
                inventoryCount: inventoryCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String type,
                Value<String?> strength = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> inventoryCount = const Value.absent(),
              }) => MedicineEntityCompanion.insert(
                id: id,
                name: name,
                type: type,
                strength: strength,
                instructions: instructions,
                notes: notes,
                inventoryCount: inventoryCount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicineEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                schedulesEntityRefs = false,
                intakeLogsEntityRefs = false,
                refillRemindersEntityRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (schedulesEntityRefs) db.schedulesEntity,
                    if (intakeLogsEntityRefs) db.intakeLogsEntity,
                    if (refillRemindersEntityRefs) db.refillRemindersEntity,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (schedulesEntityRefs)
                        await $_getPrefetchedData<
                          MedicineEntityData,
                          $MedicineEntityTable,
                          SchedulesEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$MedicineEntityTableReferences
                              ._schedulesEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicineEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).schedulesEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (intakeLogsEntityRefs)
                        await $_getPrefetchedData<
                          MedicineEntityData,
                          $MedicineEntityTable,
                          IntakeLogsEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$MedicineEntityTableReferences
                              ._intakeLogsEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicineEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).intakeLogsEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicineId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (refillRemindersEntityRefs)
                        await $_getPrefetchedData<
                          MedicineEntityData,
                          $MedicineEntityTable,
                          RefillRemindersEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$MedicineEntityTableReferences
                              ._refillRemindersEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MedicineEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).refillRemindersEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.medicineId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MedicineEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicineEntityTable,
      MedicineEntityData,
      $$MedicineEntityTableFilterComposer,
      $$MedicineEntityTableOrderingComposer,
      $$MedicineEntityTableAnnotationComposer,
      $$MedicineEntityTableCreateCompanionBuilder,
      $$MedicineEntityTableUpdateCompanionBuilder,
      (MedicineEntityData, $$MedicineEntityTableReferences),
      MedicineEntityData,
      PrefetchHooks Function({
        bool schedulesEntityRefs,
        bool intakeLogsEntityRefs,
        bool refillRemindersEntityRefs,
      })
    >;
typedef $$SchedulesEntityTableCreateCompanionBuilder =
    SchedulesEntityCompanion Function({
      Value<int> id,
      required int medicineId,
      required DateTime startDate,
      Value<DateTime?> endDate,
      required String repeatPattern,
      Value<String?> weekdays,
    });
typedef $$SchedulesEntityTableUpdateCompanionBuilder =
    SchedulesEntityCompanion Function({
      Value<int> id,
      Value<int> medicineId,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<String> repeatPattern,
      Value<String?> weekdays,
    });

final class $$SchedulesEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SchedulesEntityTable,
          SchedulesEntityData
        > {
  $$SchedulesEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicineEntityTable _medicineIdTable(_$AppDatabase db) =>
      db.medicineEntity.createAlias(
        $_aliasNameGenerator(
          db.schedulesEntity.medicineId,
          db.medicineEntity.id,
        ),
      );

  $$MedicineEntityTableProcessedTableManager get medicineId {
    final $_column = $_itemColumn<int>('medicine_id')!;

    final manager = $$MedicineEntityTableTableManager(
      $_db,
      $_db.medicineEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IntakeLogsEntityTable, List<IntakeLogsEntityData>>
  _intakeLogsEntityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.intakeLogsEntity,
    aliasName: $_aliasNameGenerator(
      db.schedulesEntity.id,
      db.intakeLogsEntity.scheduleId,
    ),
  );

  $$IntakeLogsEntityTableProcessedTableManager get intakeLogsEntityRefs {
    final manager = $$IntakeLogsEntityTableTableManager(
      $_db,
      $_db.intakeLogsEntity,
    ).filter((f) => f.scheduleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _intakeLogsEntityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ReminderTimesEntityTable,
    List<ReminderTimesEntityData>
  >
  _reminderTimesEntityRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.reminderTimesEntity,
        aliasName: $_aliasNameGenerator(
          db.schedulesEntity.id,
          db.reminderTimesEntity.scheduleId,
        ),
      );

  $$ReminderTimesEntityTableProcessedTableManager get reminderTimesEntityRefs {
    final manager = $$ReminderTimesEntityTableTableManager(
      $_db,
      $_db.reminderTimesEntity,
    ).filter((f) => f.scheduleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _reminderTimesEntityRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SchedulesEntityTableFilterComposer
    extends Composer<_$AppDatabase, $SchedulesEntityTable> {
  $$SchedulesEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repeatPattern => $composableBuilder(
    column: $table.repeatPattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weekdays => $composableBuilder(
    column: $table.weekdays,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicineEntityTableFilterComposer get medicineId {
    final $$MedicineEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableFilterComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> intakeLogsEntityRefs(
    Expression<bool> Function($$IntakeLogsEntityTableFilterComposer f) f,
  ) {
    final $$IntakeLogsEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableFilterComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> reminderTimesEntityRefs(
    Expression<bool> Function($$ReminderTimesEntityTableFilterComposer f) f,
  ) {
    final $$ReminderTimesEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminderTimesEntity,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReminderTimesEntityTableFilterComposer(
            $db: $db,
            $table: $db.reminderTimesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SchedulesEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $SchedulesEntityTable> {
  $$SchedulesEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repeatPattern => $composableBuilder(
    column: $table.repeatPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weekdays => $composableBuilder(
    column: $table.weekdays,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicineEntityTableOrderingComposer get medicineId {
    final $$MedicineEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableOrderingComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SchedulesEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchedulesEntityTable> {
  $$SchedulesEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get repeatPattern => $composableBuilder(
    column: $table.repeatPattern,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weekdays =>
      $composableBuilder(column: $table.weekdays, builder: (column) => column);

  $$MedicineEntityTableAnnotationComposer get medicineId {
    final $$MedicineEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> intakeLogsEntityRefs<T extends Object>(
    Expression<T> Function($$IntakeLogsEntityTableAnnotationComposer a) f,
  ) {
    final $$IntakeLogsEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.scheduleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> reminderTimesEntityRefs<T extends Object>(
    Expression<T> Function($$ReminderTimesEntityTableAnnotationComposer a) f,
  ) {
    final $$ReminderTimesEntityTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.reminderTimesEntity,
          getReferencedColumn: (t) => t.scheduleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ReminderTimesEntityTableAnnotationComposer(
                $db: $db,
                $table: $db.reminderTimesEntity,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SchedulesEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchedulesEntityTable,
          SchedulesEntityData,
          $$SchedulesEntityTableFilterComposer,
          $$SchedulesEntityTableOrderingComposer,
          $$SchedulesEntityTableAnnotationComposer,
          $$SchedulesEntityTableCreateCompanionBuilder,
          $$SchedulesEntityTableUpdateCompanionBuilder,
          (SchedulesEntityData, $$SchedulesEntityTableReferences),
          SchedulesEntityData,
          PrefetchHooks Function({
            bool medicineId,
            bool intakeLogsEntityRefs,
            bool reminderTimesEntityRefs,
          })
        > {
  $$SchedulesEntityTableTableManager(
    _$AppDatabase db,
    $SchedulesEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchedulesEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchedulesEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchedulesEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> medicineId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String> repeatPattern = const Value.absent(),
                Value<String?> weekdays = const Value.absent(),
              }) => SchedulesEntityCompanion(
                id: id,
                medicineId: medicineId,
                startDate: startDate,
                endDate: endDate,
                repeatPattern: repeatPattern,
                weekdays: weekdays,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int medicineId,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                required String repeatPattern,
                Value<String?> weekdays = const Value.absent(),
              }) => SchedulesEntityCompanion.insert(
                id: id,
                medicineId: medicineId,
                startDate: startDate,
                endDate: endDate,
                repeatPattern: repeatPattern,
                weekdays: weekdays,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SchedulesEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                medicineId = false,
                intakeLogsEntityRefs = false,
                reminderTimesEntityRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (intakeLogsEntityRefs) db.intakeLogsEntity,
                    if (reminderTimesEntityRefs) db.reminderTimesEntity,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (medicineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.medicineId,
                                    referencedTable:
                                        $$SchedulesEntityTableReferences
                                            ._medicineIdTable(db),
                                    referencedColumn:
                                        $$SchedulesEntityTableReferences
                                            ._medicineIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (intakeLogsEntityRefs)
                        await $_getPrefetchedData<
                          SchedulesEntityData,
                          $SchedulesEntityTable,
                          IntakeLogsEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$SchedulesEntityTableReferences
                              ._intakeLogsEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SchedulesEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).intakeLogsEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scheduleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (reminderTimesEntityRefs)
                        await $_getPrefetchedData<
                          SchedulesEntityData,
                          $SchedulesEntityTable,
                          ReminderTimesEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$SchedulesEntityTableReferences
                              ._reminderTimesEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SchedulesEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).reminderTimesEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scheduleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SchedulesEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchedulesEntityTable,
      SchedulesEntityData,
      $$SchedulesEntityTableFilterComposer,
      $$SchedulesEntityTableOrderingComposer,
      $$SchedulesEntityTableAnnotationComposer,
      $$SchedulesEntityTableCreateCompanionBuilder,
      $$SchedulesEntityTableUpdateCompanionBuilder,
      (SchedulesEntityData, $$SchedulesEntityTableReferences),
      SchedulesEntityData,
      PrefetchHooks Function({
        bool medicineId,
        bool intakeLogsEntityRefs,
        bool reminderTimesEntityRefs,
      })
    >;
typedef $$IntakeLogsEntityTableCreateCompanionBuilder =
    IntakeLogsEntityCompanion Function({
      Value<int> id,
      required int scheduleId,
      required int medicineId,
      required DateTime intendedTime,
      Value<DateTime?> actualTime,
      Value<String> status,
      Value<String?> note,
    });
typedef $$IntakeLogsEntityTableUpdateCompanionBuilder =
    IntakeLogsEntityCompanion Function({
      Value<int> id,
      Value<int> scheduleId,
      Value<int> medicineId,
      Value<DateTime> intendedTime,
      Value<DateTime?> actualTime,
      Value<String> status,
      Value<String?> note,
    });

final class $$IntakeLogsEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $IntakeLogsEntityTable,
          IntakeLogsEntityData
        > {
  $$IntakeLogsEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SchedulesEntityTable _scheduleIdTable(_$AppDatabase db) =>
      db.schedulesEntity.createAlias(
        $_aliasNameGenerator(
          db.intakeLogsEntity.scheduleId,
          db.schedulesEntity.id,
        ),
      );

  $$SchedulesEntityTableProcessedTableManager get scheduleId {
    final $_column = $_itemColumn<int>('schedule_id')!;

    final manager = $$SchedulesEntityTableTableManager(
      $_db,
      $_db.schedulesEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MedicineEntityTable _medicineIdTable(_$AppDatabase db) =>
      db.medicineEntity.createAlias(
        $_aliasNameGenerator(
          db.intakeLogsEntity.medicineId,
          db.medicineEntity.id,
        ),
      );

  $$MedicineEntityTableProcessedTableManager get medicineId {
    final $_column = $_itemColumn<int>('medicine_id')!;

    final manager = $$MedicineEntityTableTableManager(
      $_db,
      $_db.medicineEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SnoozesEntityTable, List<SnoozesEntityData>>
  _snoozesEntityRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.snoozesEntity,
    aliasName: $_aliasNameGenerator(
      db.intakeLogsEntity.id,
      db.snoozesEntity.intakeLogId,
    ),
  );

  $$SnoozesEntityTableProcessedTableManager get snoozesEntityRefs {
    final manager = $$SnoozesEntityTableTableManager(
      $_db,
      $_db.snoozesEntity,
    ).filter((f) => f.intakeLogId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_snoozesEntityRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IntakeLogsEntityTableFilterComposer
    extends Composer<_$AppDatabase, $IntakeLogsEntityTable> {
  $$IntakeLogsEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get intendedTime => $composableBuilder(
    column: $table.intendedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualTime => $composableBuilder(
    column: $table.actualTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$SchedulesEntityTableFilterComposer get scheduleId {
    final $$SchedulesEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableFilterComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicineEntityTableFilterComposer get medicineId {
    final $$MedicineEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableFilterComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> snoozesEntityRefs(
    Expression<bool> Function($$SnoozesEntityTableFilterComposer f) f,
  ) {
    final $$SnoozesEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snoozesEntity,
      getReferencedColumn: (t) => t.intakeLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnoozesEntityTableFilterComposer(
            $db: $db,
            $table: $db.snoozesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IntakeLogsEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $IntakeLogsEntityTable> {
  $$IntakeLogsEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get intendedTime => $composableBuilder(
    column: $table.intendedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualTime => $composableBuilder(
    column: $table.actualTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$SchedulesEntityTableOrderingComposer get scheduleId {
    final $$SchedulesEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableOrderingComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicineEntityTableOrderingComposer get medicineId {
    final $$MedicineEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableOrderingComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IntakeLogsEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntakeLogsEntityTable> {
  $$IntakeLogsEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get intendedTime => $composableBuilder(
    column: $table.intendedTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualTime => $composableBuilder(
    column: $table.actualTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$SchedulesEntityTableAnnotationComposer get scheduleId {
    final $$SchedulesEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MedicineEntityTableAnnotationComposer get medicineId {
    final $$MedicineEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> snoozesEntityRefs<T extends Object>(
    Expression<T> Function($$SnoozesEntityTableAnnotationComposer a) f,
  ) {
    final $$SnoozesEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.snoozesEntity,
      getReferencedColumn: (t) => t.intakeLogId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SnoozesEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.snoozesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IntakeLogsEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IntakeLogsEntityTable,
          IntakeLogsEntityData,
          $$IntakeLogsEntityTableFilterComposer,
          $$IntakeLogsEntityTableOrderingComposer,
          $$IntakeLogsEntityTableAnnotationComposer,
          $$IntakeLogsEntityTableCreateCompanionBuilder,
          $$IntakeLogsEntityTableUpdateCompanionBuilder,
          (IntakeLogsEntityData, $$IntakeLogsEntityTableReferences),
          IntakeLogsEntityData,
          PrefetchHooks Function({
            bool scheduleId,
            bool medicineId,
            bool snoozesEntityRefs,
          })
        > {
  $$IntakeLogsEntityTableTableManager(
    _$AppDatabase db,
    $IntakeLogsEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntakeLogsEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntakeLogsEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntakeLogsEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> scheduleId = const Value.absent(),
                Value<int> medicineId = const Value.absent(),
                Value<DateTime> intendedTime = const Value.absent(),
                Value<DateTime?> actualTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => IntakeLogsEntityCompanion(
                id: id,
                scheduleId: scheduleId,
                medicineId: medicineId,
                intendedTime: intendedTime,
                actualTime: actualTime,
                status: status,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int scheduleId,
                required int medicineId,
                required DateTime intendedTime,
                Value<DateTime?> actualTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => IntakeLogsEntityCompanion.insert(
                id: id,
                scheduleId: scheduleId,
                medicineId: medicineId,
                intendedTime: intendedTime,
                actualTime: actualTime,
                status: status,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IntakeLogsEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                scheduleId = false,
                medicineId = false,
                snoozesEntityRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (snoozesEntityRefs) db.snoozesEntity,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (scheduleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.scheduleId,
                                    referencedTable:
                                        $$IntakeLogsEntityTableReferences
                                            ._scheduleIdTable(db),
                                    referencedColumn:
                                        $$IntakeLogsEntityTableReferences
                                            ._scheduleIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (medicineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.medicineId,
                                    referencedTable:
                                        $$IntakeLogsEntityTableReferences
                                            ._medicineIdTable(db),
                                    referencedColumn:
                                        $$IntakeLogsEntityTableReferences
                                            ._medicineIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (snoozesEntityRefs)
                        await $_getPrefetchedData<
                          IntakeLogsEntityData,
                          $IntakeLogsEntityTable,
                          SnoozesEntityData
                        >(
                          currentTable: table,
                          referencedTable: $$IntakeLogsEntityTableReferences
                              ._snoozesEntityRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IntakeLogsEntityTableReferences(
                                db,
                                table,
                                p0,
                              ).snoozesEntityRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.intakeLogId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IntakeLogsEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IntakeLogsEntityTable,
      IntakeLogsEntityData,
      $$IntakeLogsEntityTableFilterComposer,
      $$IntakeLogsEntityTableOrderingComposer,
      $$IntakeLogsEntityTableAnnotationComposer,
      $$IntakeLogsEntityTableCreateCompanionBuilder,
      $$IntakeLogsEntityTableUpdateCompanionBuilder,
      (IntakeLogsEntityData, $$IntakeLogsEntityTableReferences),
      IntakeLogsEntityData,
      PrefetchHooks Function({
        bool scheduleId,
        bool medicineId,
        bool snoozesEntityRefs,
      })
    >;
typedef $$RefillRemindersEntityTableCreateCompanionBuilder =
    RefillRemindersEntityCompanion Function({
      Value<int> id,
      required int medicineId,
      required int threshold,
      Value<bool> notified,
    });
typedef $$RefillRemindersEntityTableUpdateCompanionBuilder =
    RefillRemindersEntityCompanion Function({
      Value<int> id,
      Value<int> medicineId,
      Value<int> threshold,
      Value<bool> notified,
    });

final class $$RefillRemindersEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RefillRemindersEntityTable,
          RefillRemindersEntityData
        > {
  $$RefillRemindersEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MedicineEntityTable _medicineIdTable(_$AppDatabase db) =>
      db.medicineEntity.createAlias(
        $_aliasNameGenerator(
          db.refillRemindersEntity.medicineId,
          db.medicineEntity.id,
        ),
      );

  $$MedicineEntityTableProcessedTableManager get medicineId {
    final $_column = $_itemColumn<int>('medicine_id')!;

    final manager = $$MedicineEntityTableTableManager(
      $_db,
      $_db.medicineEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_medicineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RefillRemindersEntityTableFilterComposer
    extends Composer<_$AppDatabase, $RefillRemindersEntityTable> {
  $$RefillRemindersEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get threshold => $composableBuilder(
    column: $table.threshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notified => $composableBuilder(
    column: $table.notified,
    builder: (column) => ColumnFilters(column),
  );

  $$MedicineEntityTableFilterComposer get medicineId {
    final $$MedicineEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableFilterComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RefillRemindersEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $RefillRemindersEntityTable> {
  $$RefillRemindersEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get threshold => $composableBuilder(
    column: $table.threshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notified => $composableBuilder(
    column: $table.notified,
    builder: (column) => ColumnOrderings(column),
  );

  $$MedicineEntityTableOrderingComposer get medicineId {
    final $$MedicineEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableOrderingComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RefillRemindersEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $RefillRemindersEntityTable> {
  $$RefillRemindersEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get threshold =>
      $composableBuilder(column: $table.threshold, builder: (column) => column);

  GeneratedColumn<bool> get notified =>
      $composableBuilder(column: $table.notified, builder: (column) => column);

  $$MedicineEntityTableAnnotationComposer get medicineId {
    final $$MedicineEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.medicineId,
      referencedTable: $db.medicineEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicineEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.medicineEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RefillRemindersEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RefillRemindersEntityTable,
          RefillRemindersEntityData,
          $$RefillRemindersEntityTableFilterComposer,
          $$RefillRemindersEntityTableOrderingComposer,
          $$RefillRemindersEntityTableAnnotationComposer,
          $$RefillRemindersEntityTableCreateCompanionBuilder,
          $$RefillRemindersEntityTableUpdateCompanionBuilder,
          (RefillRemindersEntityData, $$RefillRemindersEntityTableReferences),
          RefillRemindersEntityData,
          PrefetchHooks Function({bool medicineId})
        > {
  $$RefillRemindersEntityTableTableManager(
    _$AppDatabase db,
    $RefillRemindersEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RefillRemindersEntityTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RefillRemindersEntityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RefillRemindersEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> medicineId = const Value.absent(),
                Value<int> threshold = const Value.absent(),
                Value<bool> notified = const Value.absent(),
              }) => RefillRemindersEntityCompanion(
                id: id,
                medicineId: medicineId,
                threshold: threshold,
                notified: notified,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int medicineId,
                required int threshold,
                Value<bool> notified = const Value.absent(),
              }) => RefillRemindersEntityCompanion.insert(
                id: id,
                medicineId: medicineId,
                threshold: threshold,
                notified: notified,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RefillRemindersEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({medicineId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (medicineId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.medicineId,
                                referencedTable:
                                    $$RefillRemindersEntityTableReferences
                                        ._medicineIdTable(db),
                                referencedColumn:
                                    $$RefillRemindersEntityTableReferences
                                        ._medicineIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RefillRemindersEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RefillRemindersEntityTable,
      RefillRemindersEntityData,
      $$RefillRemindersEntityTableFilterComposer,
      $$RefillRemindersEntityTableOrderingComposer,
      $$RefillRemindersEntityTableAnnotationComposer,
      $$RefillRemindersEntityTableCreateCompanionBuilder,
      $$RefillRemindersEntityTableUpdateCompanionBuilder,
      (RefillRemindersEntityData, $$RefillRemindersEntityTableReferences),
      RefillRemindersEntityData,
      PrefetchHooks Function({bool medicineId})
    >;
typedef $$ReminderTimesEntityTableCreateCompanionBuilder =
    ReminderTimesEntityCompanion Function({
      Value<int> id,
      required int scheduleId,
      required String time,
      Value<bool> enabled,
    });
typedef $$ReminderTimesEntityTableUpdateCompanionBuilder =
    ReminderTimesEntityCompanion Function({
      Value<int> id,
      Value<int> scheduleId,
      Value<String> time,
      Value<bool> enabled,
    });

final class $$ReminderTimesEntityTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ReminderTimesEntityTable,
          ReminderTimesEntityData
        > {
  $$ReminderTimesEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SchedulesEntityTable _scheduleIdTable(_$AppDatabase db) =>
      db.schedulesEntity.createAlias(
        $_aliasNameGenerator(
          db.reminderTimesEntity.scheduleId,
          db.schedulesEntity.id,
        ),
      );

  $$SchedulesEntityTableProcessedTableManager get scheduleId {
    final $_column = $_itemColumn<int>('schedule_id')!;

    final manager = $$SchedulesEntityTableTableManager(
      $_db,
      $_db.schedulesEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scheduleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReminderTimesEntityTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderTimesEntityTable> {
  $$ReminderTimesEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  $$SchedulesEntityTableFilterComposer get scheduleId {
    final $$SchedulesEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableFilterComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderTimesEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderTimesEntityTable> {
  $$ReminderTimesEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  $$SchedulesEntityTableOrderingComposer get scheduleId {
    final $$SchedulesEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableOrderingComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderTimesEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderTimesEntityTable> {
  $$ReminderTimesEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  $$SchedulesEntityTableAnnotationComposer get scheduleId {
    final $$SchedulesEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scheduleId,
      referencedTable: $db.schedulesEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SchedulesEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.schedulesEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReminderTimesEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReminderTimesEntityTable,
          ReminderTimesEntityData,
          $$ReminderTimesEntityTableFilterComposer,
          $$ReminderTimesEntityTableOrderingComposer,
          $$ReminderTimesEntityTableAnnotationComposer,
          $$ReminderTimesEntityTableCreateCompanionBuilder,
          $$ReminderTimesEntityTableUpdateCompanionBuilder,
          (ReminderTimesEntityData, $$ReminderTimesEntityTableReferences),
          ReminderTimesEntityData,
          PrefetchHooks Function({bool scheduleId})
        > {
  $$ReminderTimesEntityTableTableManager(
    _$AppDatabase db,
    $ReminderTimesEntityTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderTimesEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderTimesEntityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ReminderTimesEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> scheduleId = const Value.absent(),
                Value<String> time = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
              }) => ReminderTimesEntityCompanion(
                id: id,
                scheduleId: scheduleId,
                time: time,
                enabled: enabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int scheduleId,
                required String time,
                Value<bool> enabled = const Value.absent(),
              }) => ReminderTimesEntityCompanion.insert(
                id: id,
                scheduleId: scheduleId,
                time: time,
                enabled: enabled,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReminderTimesEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({scheduleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (scheduleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.scheduleId,
                                referencedTable:
                                    $$ReminderTimesEntityTableReferences
                                        ._scheduleIdTable(db),
                                referencedColumn:
                                    $$ReminderTimesEntityTableReferences
                                        ._scheduleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReminderTimesEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReminderTimesEntityTable,
      ReminderTimesEntityData,
      $$ReminderTimesEntityTableFilterComposer,
      $$ReminderTimesEntityTableOrderingComposer,
      $$ReminderTimesEntityTableAnnotationComposer,
      $$ReminderTimesEntityTableCreateCompanionBuilder,
      $$ReminderTimesEntityTableUpdateCompanionBuilder,
      (ReminderTimesEntityData, $$ReminderTimesEntityTableReferences),
      ReminderTimesEntityData,
      PrefetchHooks Function({bool scheduleId})
    >;
typedef $$SnoozesEntityTableCreateCompanionBuilder =
    SnoozesEntityCompanion Function({
      Value<int> id,
      required int intakeLogId,
      required DateTime snoozedUntil,
    });
typedef $$SnoozesEntityTableUpdateCompanionBuilder =
    SnoozesEntityCompanion Function({
      Value<int> id,
      Value<int> intakeLogId,
      Value<DateTime> snoozedUntil,
    });

final class $$SnoozesEntityTableReferences
    extends
        BaseReferences<_$AppDatabase, $SnoozesEntityTable, SnoozesEntityData> {
  $$SnoozesEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IntakeLogsEntityTable _intakeLogIdTable(_$AppDatabase db) =>
      db.intakeLogsEntity.createAlias(
        $_aliasNameGenerator(
          db.snoozesEntity.intakeLogId,
          db.intakeLogsEntity.id,
        ),
      );

  $$IntakeLogsEntityTableProcessedTableManager get intakeLogId {
    final $_column = $_itemColumn<int>('intake_log_id')!;

    final manager = $$IntakeLogsEntityTableTableManager(
      $_db,
      $_db.intakeLogsEntity,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_intakeLogIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SnoozesEntityTableFilterComposer
    extends Composer<_$AppDatabase, $SnoozesEntityTable> {
  $$SnoozesEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnFilters(column),
  );

  $$IntakeLogsEntityTableFilterComposer get intakeLogId {
    final $$IntakeLogsEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.intakeLogId,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableFilterComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnoozesEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $SnoozesEntityTable> {
  $$SnoozesEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  $$IntakeLogsEntityTableOrderingComposer get intakeLogId {
    final $$IntakeLogsEntityTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.intakeLogId,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableOrderingComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnoozesEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $SnoozesEntityTable> {
  $$SnoozesEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => column,
  );

  $$IntakeLogsEntityTableAnnotationComposer get intakeLogId {
    final $$IntakeLogsEntityTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.intakeLogId,
      referencedTable: $db.intakeLogsEntity,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IntakeLogsEntityTableAnnotationComposer(
            $db: $db,
            $table: $db.intakeLogsEntity,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SnoozesEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SnoozesEntityTable,
          SnoozesEntityData,
          $$SnoozesEntityTableFilterComposer,
          $$SnoozesEntityTableOrderingComposer,
          $$SnoozesEntityTableAnnotationComposer,
          $$SnoozesEntityTableCreateCompanionBuilder,
          $$SnoozesEntityTableUpdateCompanionBuilder,
          (SnoozesEntityData, $$SnoozesEntityTableReferences),
          SnoozesEntityData,
          PrefetchHooks Function({bool intakeLogId})
        > {
  $$SnoozesEntityTableTableManager(_$AppDatabase db, $SnoozesEntityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SnoozesEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SnoozesEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SnoozesEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> intakeLogId = const Value.absent(),
                Value<DateTime> snoozedUntil = const Value.absent(),
              }) => SnoozesEntityCompanion(
                id: id,
                intakeLogId: intakeLogId,
                snoozedUntil: snoozedUntil,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int intakeLogId,
                required DateTime snoozedUntil,
              }) => SnoozesEntityCompanion.insert(
                id: id,
                intakeLogId: intakeLogId,
                snoozedUntil: snoozedUntil,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SnoozesEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({intakeLogId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (intakeLogId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.intakeLogId,
                                referencedTable: $$SnoozesEntityTableReferences
                                    ._intakeLogIdTable(db),
                                referencedColumn: $$SnoozesEntityTableReferences
                                    ._intakeLogIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SnoozesEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SnoozesEntityTable,
      SnoozesEntityData,
      $$SnoozesEntityTableFilterComposer,
      $$SnoozesEntityTableOrderingComposer,
      $$SnoozesEntityTableAnnotationComposer,
      $$SnoozesEntityTableCreateCompanionBuilder,
      $$SnoozesEntityTableUpdateCompanionBuilder,
      (SnoozesEntityData, $$SnoozesEntityTableReferences),
      SnoozesEntityData,
      PrefetchHooks Function({bool intakeLogId})
    >;
typedef $$UserEntityTableCreateCompanionBuilder =
    UserEntityCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> age,
      Value<String?> gender,
      Value<double?> weight,
      Value<String?> allergies,
      Value<String?> medicalNotes,
    });
typedef $$UserEntityTableUpdateCompanionBuilder =
    UserEntityCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> age,
      Value<String?> gender,
      Value<double?> weight,
      Value<String?> allergies,
      Value<String?> medicalNotes,
    });

class $$UserEntityTableFilterComposer
    extends Composer<_$AppDatabase, $UserEntityTable> {
  $$UserEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicalNotes => $composableBuilder(
    column: $table.medicalNotes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $UserEntityTable> {
  $$UserEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get allergies => $composableBuilder(
    column: $table.allergies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicalNotes => $composableBuilder(
    column: $table.medicalNotes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserEntityTable> {
  $$UserEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get allergies =>
      $composableBuilder(column: $table.allergies, builder: (column) => column);

  GeneratedColumn<String> get medicalNotes => $composableBuilder(
    column: $table.medicalNotes,
    builder: (column) => column,
  );
}

class $$UserEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserEntityTable,
          UserEntityData,
          $$UserEntityTableFilterComposer,
          $$UserEntityTableOrderingComposer,
          $$UserEntityTableAnnotationComposer,
          $$UserEntityTableCreateCompanionBuilder,
          $$UserEntityTableUpdateCompanionBuilder,
          (
            UserEntityData,
            BaseReferences<_$AppDatabase, $UserEntityTable, UserEntityData>,
          ),
          UserEntityData,
          PrefetchHooks Function()
        > {
  $$UserEntityTableTableManager(_$AppDatabase db, $UserEntityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> medicalNotes = const Value.absent(),
              }) => UserEntityCompanion(
                id: id,
                name: name,
                age: age,
                gender: gender,
                weight: weight,
                allergies: allergies,
                medicalNotes: medicalNotes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> age = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String?> allergies = const Value.absent(),
                Value<String?> medicalNotes = const Value.absent(),
              }) => UserEntityCompanion.insert(
                id: id,
                name: name,
                age: age,
                gender: gender,
                weight: weight,
                allergies: allergies,
                medicalNotes: medicalNotes,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserEntityTable,
      UserEntityData,
      $$UserEntityTableFilterComposer,
      $$UserEntityTableOrderingComposer,
      $$UserEntityTableAnnotationComposer,
      $$UserEntityTableCreateCompanionBuilder,
      $$UserEntityTableUpdateCompanionBuilder,
      (
        UserEntityData,
        BaseReferences<_$AppDatabase, $UserEntityTable, UserEntityData>,
      ),
      UserEntityData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MedicineEntityTableTableManager get medicineEntity =>
      $$MedicineEntityTableTableManager(_db, _db.medicineEntity);
  $$SchedulesEntityTableTableManager get schedulesEntity =>
      $$SchedulesEntityTableTableManager(_db, _db.schedulesEntity);
  $$IntakeLogsEntityTableTableManager get intakeLogsEntity =>
      $$IntakeLogsEntityTableTableManager(_db, _db.intakeLogsEntity);
  $$RefillRemindersEntityTableTableManager get refillRemindersEntity =>
      $$RefillRemindersEntityTableTableManager(_db, _db.refillRemindersEntity);
  $$ReminderTimesEntityTableTableManager get reminderTimesEntity =>
      $$ReminderTimesEntityTableTableManager(_db, _db.reminderTimesEntity);
  $$SnoozesEntityTableTableManager get snoozesEntity =>
      $$SnoozesEntityTableTableManager(_db, _db.snoozesEntity);
  $$UserEntityTableTableManager get userEntity =>
      $$UserEntityTableTableManager(_db, _db.userEntity);
}
