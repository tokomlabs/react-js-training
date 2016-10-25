package view.page;

import api.react.addon.ReactRedux;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import view.component.ScenarioView;

typedef ScenarioPageProps = {
	? dispatch : Dynamic -> Void,
	? params : {
		id : String
	},
	view : ScenarioPageViewProps
}

class ScenarioPage extends ReactComponentOf<ScenarioPageProps, Dynamic, Dynamic> {

	static var Reduxed : ScenarioPage = ReactRedux.connect(mapStateToProps)(ScenarioPage);

	static function mapStateToProps(st : model.State, ownProps : ScenarioPageProps) : ScenarioPageProps {

		return {
			view: {
				scenario: rdcr.ScenariosRdcr.getScenarioById(st.scenarios, ownProps.params.id),
				isFetching: rdcr.ScenariosRdcr.isFetching(st.scenarios)
			}
		}
	}

	override function componentWillMount() {

		props.dispatch(ctrl.ScenariosCtrl.fetch());
	}

	override function render() {

		return jsx('
			<ScenarioPageView {...props.view} />
		');
	}
}
typedef ScenarioPageViewProps = {
	isFetching : Bool,
	scenario : dto.Scenario
}

class ScenarioPageView extends ReactComponentOf<ScenarioPageViewProps, Dynamic, Dynamic> {

	function renderScenario() {

		if (props.scenario == null) {

			return jsx('
				<div>
					Scénario non trouvé!
				</div>
			');
		}
		return jsx('
			<ScenarioView scenario={props.scenario}>
		');
	}

	override function render() {


		if (props.isFetching) {

			return jsx('
				<div>Chargement...</div>
			');
		}

		return jsx('
			<div>
				{renderScenario()}
			</div>
		');
	}
}