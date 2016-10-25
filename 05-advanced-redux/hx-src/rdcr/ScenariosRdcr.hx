package rdcr;

import model.State;

class ScenariosRdcr {

	static function getDefaultState() : ScenariosState {

		return { scenarios: [], isFetching: false };
	}

	// Reducer

	static public function execute(state : ScenariosState, action : Dynamic) : ScenariosState { js.Browser.console.log(action,state);

		if (state == null) state = getDefaultState();

		switch (action.type) {

			case "REQUEST_SCENARIOS":

				state = js.Object.assign({}, state, { isFetching: true });

			case "RECEIVE_SCENARIOS":

				state = js.Object.assign({}, state, { scenarios: action.data, isFetching: false });

			case "ERROR_SCENARIOS":

				//

		}

		return state;
	}

	// Selectors

	static public function isEmpty(state : ScenariosState) : Bool {
	
		return state.scenarios.length == 0;
	}

	static public function isFetching(state : ScenariosState) : Bool {
	
		return state.isFetching;
	}

	static public function getScenarioById(state : ScenariosState, id : String) : Null<dto.Scenario> {
	
		return Lambda.find(state.scenarios,function(sc){ return sc.id == id; });
	}

	static public function getActiveScenarios(state : ScenariosState) : Array<dto.Scenario> {
	
		return state.scenarios;
	}
}