db.students.insert({
	_id : 1,
	name: 'mary',
	surname: 'murray',
	age: 45,
	nationality: 'irish',
	course: [ {
			name: "database",
			credits: 10,
			date : "10/10/2011",
			mark : 56
		},
		{
			name: "maths",
			credits: 5,
			date : "09/11/2012",
			mark : 76
		},
		{
			name: "programming",
			credits: 15,
			date : "02/07/2014",
			mark : 45
		}
	]
});
db.students.insert({
	name: 'bill',
	surname: 'bellichick',
	qge: 32,
	nationality: 'american',
	course: [ {
			name: "database",
			credits: 10,
			date : "10/10/2011",
			mark : 55
		},
		{
			name: "maths",
			credits: 5,
			date : "09/11/2012",
			mark : 87
		},
		{
			name: "programming",
			credits: 15,
			date : "10/10/2011",
			mark : 45
		}
	]
});
db.students.insert({
	first: 'tom',
	last: 'brady',
	age: 22,
	nationality: 'canadian',
	course: [ {
			name: "database",
			credits: 10,
			date : "09/11/2012",
			mark : 34
		},
		{
			name: "maths",
			credits: 5,
			date : "02/07/2014",
			mark : 56
		}
	]
});
db.students.insert({
	first: 'john',
	last: 'bale',
	age: 24,
	nationality: 'english',
	course: [ {
			name: "database",
			credits: 10,
			date : "10/10/2011",
			mark : 71
		},
		{
			name: "maths",
			credits: 5,
			date : "10/10/2011",
			mark : 88
		},
		{
			name: "programming",
			credits: 15,
			date : "09/11/2012",
			mark : 95
		}
	]
});

db.students.find({course: {$elemMatch: {mark: {'$lt':40} }}});
db.students.find({course: {$elemMatch: {mark: {'$gte':40}  }}});

db.students.aggregate( { { $unwind: "$course" },"$group": { name: "$first", averagemark: { $avg: "$course.mark"}}});

db.students.aggregate([{ $unwind: "$course" },{ $group : { _id: "$_id", avgAge : {  $avg : "$course.mark" }, max : {  $max : "$course.mark" } } }]);
