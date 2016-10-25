package srv;

class PdaApiSrv {

	static public function getScenarios(onSuccess : Array<dto.Scenario> -> Void,
										onError : String -> Void) : Void {

		var req : js.html.XMLHttpRequest = new js.html.XMLHttpRequest();

		req.onload = 

			function(?_){

				var ret : Array<dto.Scenario> =

					haxe.Json.parse(req.responseText);

				onSuccess(ret);
			}

		req.onerror = function(e:Dynamic) {

				onError(e);
			}

		req.open("GET", "http://192.168.0.5:30082/scenarios", true);

		req.send();

	}
}