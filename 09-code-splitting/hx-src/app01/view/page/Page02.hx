package app01.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class Page02 extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div>
				<p>Page 02 from app 01...</p>
			</div>
		');
	}
}
