package view.layout;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.router.Link;

class MyLayout extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div className="page">

				<div className="header">
					HERAKLES PORTAL
				</div>

				<div className="content">
					{ props.children }
				</div>

				<div className="footer">
					<Link to="/">Home</Link>
				</div>

			</div>
		');
	}
}