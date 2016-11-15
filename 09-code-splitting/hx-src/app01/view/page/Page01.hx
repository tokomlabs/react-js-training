package app01.view.page;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.ReactRedux;

import api.react.addon.intl.FormattedMessage;

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

	override function render() { trace(props.cnt);

		return jsx('
			<div>
				<h1><FormattedMessage id="page1_title" /></h1>
				<p><FormattedMessage id="msg-count" values={{ cnt: Std.string(props.cnt) }} /></p>
				<button onClick={increaseCb}><FormattedMessage id="btn-increase" /></button>
			</div>
		');
	}
}
