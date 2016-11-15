package app02.view;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;

import api.react.addon.router.Link;

class Application extends ReactComponentOf<Dynamic, Dynamic, Dynamic> {

	public function new(p) {

		super(p);

		trace('new app02.view.Application');
	}

	override function render() {

		return "test";
	}
}