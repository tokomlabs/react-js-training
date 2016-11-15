package portal.rdcr;

import portal.model.PortalState;

class PortalRdcr {

	static public function getDefaultState() : PortalState {

		return { }
	}

	static public function execute(state : PortalState, action : Dynamic) : PortalState {

		if (state == null) {

			state = getDefaultState();
		}

		switch (action.type) {

			case "login":

				return js.Object.assign({},state,{ user: action.user });
		}

		return state;
	}
}