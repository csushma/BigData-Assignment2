reviews = load '/usr/lib/hue/input/review2.csv' using PigStorage('^');
review = foreach reviews generate (chararray)$2 as business_id, (double)$20 as stars;
gReview = group review by business_id;
avgRating = foreach gReview generate group as Bid, AVG(review.stars) as avgStars;

business1 = load '/usr/lib/hue/input/business2.csv' using PigStorage('^');
business = foreach business1 generate (chararray)$2 as business_id2, (chararray)$3 as full_address, (chararray)$10 as categories; 

joinBusinessId = join avgRating by $0, business by $0;

topRating = ORDER joinBusinessId by $1 DESC;
result = LIMIT topRating 10;

dump result;
