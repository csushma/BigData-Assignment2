A = load '/usr/lib/hue/input/review2.csv' using PigStorage('^');
B = load '/usr/lib/hue/input/business2.csv' using PigStorage('^');
Out = COGROUP A BY (chararray)$2, B BY (chararray)$2; 
flat = foreach Out generate flatten(A), flatten(B);
final = limit flat 6;
DUMP final;