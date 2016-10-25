package view.page;

import api.react.addon.ReactRouter;
import api.react.addon.ReactRedux;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

typedef ScenariosPageProps = {
	? dispatch : Dynamic -> Void,
	? router : Dynamic,
	isFetching : Bool,
	scenarios : Array<dto.Scenario>
}

class ScenariosPage extends ReactComponentOf<ScenariosPageProps, Dynamic, Dynamic> {

	static var Routed : ScenariosPage = ReactRouter.withRouter(ScenariosPage);

	static var Reduxed : ScenariosPage = ReactRedux.connect(mapStateToProps)(ScenariosPage.Routed);

	static function mapStateToProps(st : model.State, ownProps : ScenariosPageProps) : ScenariosPageProps {

		return {
			scenarios: rdcr.ScenariosRdcr.getActiveScenarios(st.scenarios),
			isFetching: rdcr.ScenariosRdcr.isFetching(st.scenarios)
		}
	}

	override function componentWillMount() {

		props.dispatch(ctrl.ScenariosCtrl.fetch());
	}

	function goToScenario(sc : dto.Scenario) {

		props.router.push('/${sc.id}');
	}

	function renderScenarioLine(sc : dto.Scenario) {

		return jsx('
			<tr onClick={ function(){ goToScenario(sc); } }>
				<td>{sc.title}</td>
			</tr>
		');
	}

	function renderScenarios() {

		if (props.isFetching) {

			return jsx('
				<div>Chargement...</div>
			');
		}
		if (props.scenarios.length == 0) {

			return jsx('<div>Pas de scenario disponible</div>');
		}
		return jsx('
			<table>
				<tbody>
					{ [ for(sc in props.scenarios) renderScenarioLine(sc) ] }
				</tbody>
			</table>
		');
	}

	override function render() {

		return jsx('
			<div>
				<h3>Liste des scenarios</h3>
				{ renderScenarios() }
			</div>
		');
	}
}