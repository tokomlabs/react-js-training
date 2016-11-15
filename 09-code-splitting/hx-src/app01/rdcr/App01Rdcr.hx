package app01.rdcr;

import app01.model.State;

class App01Rdcr {

	static public function getDefaultState() : State {

		return {
			cnt: 0
		}
	}

	static public function execute(state : State, action : Dynamic) {

		if (state == null) {

			state = getDefaultState();
		}

		switch (action.type) {

			case "test1" : 

				return js.Object.assign({},state,{cnt: state.cnt+1});
		}

		return state;
	}
}