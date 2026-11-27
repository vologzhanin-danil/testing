CREATE TABLE exercises (
    exercise_id INTEGER PRIMARY KEY,
    exercise_name VARCHAR(50) NOT NULL UNIQUE
    CHECK (exercise_name REGEXP '^[A-Za-zА-Яа-яІіЇїЄєҐґ0-9 ''’-]{3,50}$')
);

CREATE TABLE reference_points (
    reference_point_id INTEGER PRIMARY KEY,
    exercise_id INTEGER NOT NULL,
    point_seq INTEGER NOT NULL CHECK (point_seq >= 1),
    time_offset FLOAT NOT NULL CHECK (time_offset >= 0),
    reference_angle FLOAT NOT NULL CHECK (reference_angle BETWEEN -900 AND 900),
    FOREIGN KEY (exercise_id) REFERENCES exercises (exercise_id),
    UNIQUE (exercise_id, point_seq)
);

CREATE TABLE calibrations (
    calibration_id INTEGER PRIMARY KEY,
    neutral_angle FLOAT NOT NULL CHECK (neutral_angle BETWEEN -180 AND 180),
    calibration_date TIMESTAMP NOT NULL
);

CREATE TABLE sessions (
    session_id INTEGER PRIMARY KEY,
    exercise_id INTEGER NOT NULL,
    calibration_id INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    accuracy_percent FLOAT CHECK (accuracy_percent BETWEEN 0 AND 100),
    smoothness_percent FLOAT CHECK (smoothness_percent BETWEEN 0 AND 100),
    turn_tempo FLOAT CHECK (turn_tempo >= 0),
    FOREIGN KEY (exercise_id) REFERENCES exercises (exercise_id),
    FOREIGN KEY (calibration_id) REFERENCES calibrations (calibration_id),
    CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE sensor_readings (
    sensor_reading_id INTEGER PRIMARY KEY,
    session_id INTEGER NOT NULL,
    reading_date TIMESTAMP NOT NULL,
    acceleration_x FLOAT NOT NULL,
    acceleration_y FLOAT NOT NULL,
    angular_speed FLOAT NOT NULL,
    FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);

CREATE TABLE control_commands (
    control_command_id INTEGER PRIMARY KEY,
    sensor_reading_id INTEGER NOT NULL UNIQUE,
    steering_angle FLOAT NOT NULL
    CHECK (steering_angle BETWEEN -900 AND 900),
    command_date TIMESTAMP NOT NULL,
    FOREIGN KEY (sensor_reading_id)
    REFERENCES sensor_readings (sensor_reading_id)
);

CREATE TABLE deviations (
    deviation_id INTEGER PRIMARY KEY,
    session_id INTEGER NOT NULL,
    deviation_type VARCHAR(10) NOT NULL
    CHECK (deviation_type REGEXP '^(ANGLE|JERK)$'),
    angle_difference FLOAT,
    deviation_date TIMESTAMP NOT NULL,
    FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);
