package app01.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;

typedef Page01Props = {
	? dispatch : Dynamic -> Void,
	cnt : Int
}

class Page01 extends ReactComponentOf<Page01Props, Dynamic, Dynamic> {

	static public var Reduxed : Page01 = ReactRedux.connect(mapStateToProps)(Page01);

	static function mapStateToProps(st : Dynamic, ownProps : Page01Props) : Page01Props {

		return { cnt: st.app1.cnt };
	}

	function increaseCb() {

		props.dispatch({ type: "test1" });
	}

	override function render() {

		return jsx('
			<div>
				<h1>App1 cnt page</h1>
				<p>Current count is ${props.cnt}</p>
				<button onClick={increaseCb}>INCREASE IT</button>
			</div>
		');
	}
}
