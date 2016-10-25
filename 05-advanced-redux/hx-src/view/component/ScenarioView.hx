package view.component;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

typedef ScenarioViewProps = {
	scenario : dto.Scenario
}

class ScenarioView extends ReactComponentOf<ScenarioViewProps, Dynamic, Dynamic> {

	function renderScreen(scr) {

		return jsx('
			<div>{scr.title}</div>
		');
	}

	function renderScreens() {

		if (props.scenario.screens.length == 0) return jsx('<div>Pas d\'écran</div>');

		return jsx('
			<div>
				<span>Ecrans:</span>
				{ [ for(scr in props.scenario.screens) renderScreen(scr) ] }
			</div>
		');
	}

	override function render() {

		return jsx('
			<div>
				<h4>{props.scenario.title}</h4>
				<p>Version: {props.scenario.version}</p>
				{renderScreens()}
			</div>
		');
	}
}