
//Q1
db.teams.update( 
{_id: ObjectId("583bfaac16cf91b760552b8f") },
{ $set: { team_id: "eng1",
	date_founded: new Date("Oct 04, 1901")
 }
});

//Q2
db.teams.update( 
		{_id: ObjectId("583bfaac16cf91b760552b8f") },
		{ $set: { team_id: "eng1",
			date_founded: new Date("Oct 04, 1896"),
				 league: "Premier League",
			 points: 62,
			 name: "Manchester United",
				 players: [ { p_id: "Rooney", goal: 85, caps: 125, age: 28 },
										{ p_id: "Scholes", goal: 15, caps: 225, age: 28 },
					          { p_id: "Giggs", goal: 45, caps: 359, age: 38 },
									 { p_id: "Keane", goal: 44, caps: 326, age: 33 },
									 { p_id: "Kaka", goal: 32, caps: 112, age: 53 } ]
			 }
		});
		
//Q3
db.teams.find().sort({date_founded:-1}).limit(1).pretty()

//Q4
db.teams.update( {_id : ObjectId("583bfad816cf91b760552b96") } , 
								{$inc : {"players.$.goal" : 3} } , 
								false , true);
								
var teams =  db.teams.find( {_id : ObjectId("583bfad816cf91b760552b96") });

teams.forEach(function (setter) {
	for (var index in setter.players) {
		db.teams.update(
			{ _id:  ObjectId("583bfad816cf91b760552b96"),
				"players.goal": setter.players[index].goal 
			}, 
			{$inc : {"players.$.goal" : 3} }
		);
	}
});


//Q5
function updateRecords( objectId ) {
	var teams =  db.teams.find( {_id : objectId });

	teams.forEach(function (setter) {
		for (var index in setter.players) {
			db.teams.update(
				{ _id:  objectId,
					"players.goal": setter.players[index].goal 
				}, 
				{$set : {"players.$.caps" : Math.round(setter.players[index].caps * 0.1)} }
			);
		}
	});
}

cursor = db.teams.find({league:"Serie A"});
while ( cursor.hasNext() ) {
	updateRecords(cursor.next()._id );
}


//Q6
cursor = db.teams.find({name:'Barcelona'});
while(cursor.hasNext()) {
	db.teams.update( {name: "Arsenal"},
	 { $set: { "points": cursor.next().points } }  )
}

//Q7 
db.teams.aggregate( [
		{ $unwind: "$players" },
		{ 
			$match: { 
					'players.age' : {
						$gt: 30
					}
			 } 
		},
		{ 
			$match: {
					"players.p_id": { 
					$regex : "es" 
				}
			}
		}
]);

//Q8
db.teams.aggregate([
	{ 
		$group: { 
			_id: { $toLower: "$league" }, 
			total: { 
				$sum: "$points" 
			},
			count: { 
				$sum: 1 
			}
		}
	},
	{ 
		$sort: { 
			total: -1 
		} 
	}
 ]);

//Q9
db.teams.aggregate([
	{
		$unwind : "$players"
		},
	{ 
		$group: { 
			_id: { $toLower: "$name" }, 
			total: { 
				$sum: "$players.goal" 
			}
		}
	},
	{ 
		$sort: { 
			total: -1 
		} 
	}
 ]);

//Q10
db.teams.aggregate([
	{
		$unwind: "$players"
  	},
	{ 
		$group: { 
			_id: {  $toLower: "$name" }, 
			goals : { $sum : "$players.goal" },
			caps: { $sum : "$players.caps" } 
		}
	},
	{ $project : {
		average: {$divide: ['$caps','$goals']}
	    }},
	{ 
		$out: "student_id_avg_goals" 
	}
 ]);

//Q11
function old_vs_young(x) {
	
	var goalLTAge = 0;
	var goalGTAge = 0;
	
	var teams =  db.teams.find();

	teams.forEach(function (setter) {
		for (var index in setter.players) {
			
			var player_obj = {
				name: setter.players[index].p_id,
				age: setter.players[index].age,
				goals: setter.players[index].goal
			}
			
			if ( setter.players[index].age <= x ) {
				goalLTAge += setter.players[index].goal;
			} else {
				goalGTAge += setter.players[index].goal;
			}
			printjson(player_obj);
		}
	});
	
	if (goalGTAge > goalLTAge) {
		return 1;
	} else {
		return 0;
	}
	
}

print(old_vs_young(30));

