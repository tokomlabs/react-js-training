package common.rdcr;

import common.model.State;

class CommonRdcr {

	static public function getDefaultState() : State {

		return {
			locale: "fr"
		}
	}

	static public function execute(state : State, action : Dynamic) {

		if (state == null) {

			state = getDefaultState();
		}

		switch (action.type) {

			case "set_lang" : 

				return js.Object.assign({},state,{ locale: action.lang });
		}

		return state;
	}
}