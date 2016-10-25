package ctrl;

class ScenariosCtrl {

	static public function fetch() {

		return function(dispatch : Dynamic -> Void, getState : Void -> model.State) {

			if (!rdcr.ScenariosRdcr.isEmpty(getState().scenarios)) return;

			dispatch({ type: "REQUEST_SCENARIOS" });

			srv.PdaApiSrv.getScenarios(

				function(scs) {

					dispatch({ type: "RECEIVE_SCENARIOS", data: scs });
				},

				function(e){

					dispatch({ type: "ERROR_SCENARIOS", msg: e });
				}
			);
		}
	}
}