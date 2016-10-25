package dto;

typedef Scenario = {

	id : String,
	title : String,
	screens : Array<ScenarioScreen>
	// TODO
}

typedef ScenarioScreen = {
	id : String,
	title  :String
}