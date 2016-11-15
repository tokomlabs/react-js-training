package app01.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Page01 extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<p>Other page from App 01...</p>
			</div>
		');
	}
}
