package app01.view.layout;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.router.Link;

class App01Layout extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	override function render() {

		return jsx('
			<div className="page">

				<div className="header">
					App 01 Header
				</div>

				<div className="content">
					{ props.children }
				</div>

				<div className="footer">
					App 01 tool bar - 
					<Link to="/app1/01">page 01</Link> - <Link to="/app1/02">Page 02</Link> - <Link to="/app1/03">Page 03</Link>
				</div>

			</div>
		');
	}
}
