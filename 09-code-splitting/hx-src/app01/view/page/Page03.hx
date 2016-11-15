package app01.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Page03 extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<p>Page 03 from App 01...</p>
			</div>
		');
	}
}
