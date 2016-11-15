package app02.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class HomePage extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<h1>App 2 Main Menu</h1>
				<p>Blablabla...</p>
			</div>
		');
	}
}
