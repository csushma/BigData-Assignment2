A = load '/usr/lib/hue/input/review2.csv' using PigStorage('^');
B = load '/usr/lib/hue/input/business2.csv' using PigStorage('^');
Out = COGROUP A BY (chararray)$2, B BY (chararray)$2; 
final = limit Out 6;

dump final;
