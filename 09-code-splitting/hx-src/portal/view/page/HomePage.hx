package portal.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.router.Link;

class HomePage extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<h1>Portal Main Menu</h1>
				<Link to="/app1">Go to App 1</Link><br />
				<Link to="/app2">Go to App 2</Link><br />
			</div>
		');
	}
}
