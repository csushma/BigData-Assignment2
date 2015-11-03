REGISTER FORMAT_CAT.jar;
A = load '/usr/lib/hue/input/business2.csv' using PigStorage('^'); 
B = FOREACH A GENERATE (chararray)$2 as business_id2, (chararray)$3 as full_address, (chararray)$10 as categories;
C = FOREACH B GENERATE business_id2, full_address, FORMAT_CAT(categories);

final = LIMIT C 10;
DUMP final;