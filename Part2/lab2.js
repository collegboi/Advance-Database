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