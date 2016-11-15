package app02.view.layout;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

class App02Layout extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div className="page">

				<div className="header">
					App 02 Header
				</div>

				<div className="content">
					{ props.children }
				</div>

				<div className="footer">
					App 02 tool bar
				</div>

			</div>
		');
	}
}
