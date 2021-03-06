# React Intl

Internationalization library for React JS application.


## References

* [React Intl Bible](https://github.com/yahoo/react-intl/wiki)

* [React Intl API](https://github.com/yahoo/react-intl/wiki/API)

* [React Intl Components](https://github.com/yahoo/react-intl/wiki/Components)


## Installation

```
npm install react-intl --save
```


## React Intl notions

* React Intl is built on the [Intl javascript API](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl).

This means that for old browser that do not support this API, we need to use a [polyfill](https://github.com/andyearnshaw/Intl.js/). [See also](https://github.com/yahoo/react-intl/wiki#i18n-in-javascript).

* React Intl uses the [ICU](http://userguide.icu-project.org/formatparse/messages) message syntax which supports variable injection and pluralization:

```
{
	"greeting": "Bonjour {name}! Bienvenue sur Changr!",
	"test-plural": "Vous {itemCount, plural, =0 {n'avez pas d'item} one {avez un item} other {avez {itemCount} items}}.",
	"profile": "Profil",
	"edit-profile": "Modifier votre profil",
	"edit-action": "Modifier votre action",
	(...)
}
```

* React Intl needs internal locale data (by default, has only basic english). Those locale data can be found in the `react-intl` module under ``.

```
// app.js
import {addLocaleData} from 'react-intl';
import en from 'react-intl/locale-data/en';
import fr from 'react-intl/locale-data/fr';
import es from 'react-intl/locale-data/es';

addLocaleData([...en, ...fr, ...es]);
// ...
```

* Application locale data can be included to output build with the use `require` statements. In that case, add a json loader to your webpack config so that webpack will know how to handle it: `npm install json-loader --save-dev`

* To enable React Intl in your application, you need to wrap it in a [`IntlProvider`](https://github.com/yahoo/react-intl/wiki/Components#intlprovider) component:

```
ReactDOM.render(
    <IntlProvider
        locale={usersLocale}
        messages={translationsForUsersLocale}
    >
        <App/>
    </IntlProvider>,
    document.getElementById('container')
);
```

* There are two ways to internatialize your app: the [React Intl Components](https://github.com/yahoo/react-intl/wiki/Components) or the HOC `injectIntl()` method.

  The components: `FormattedDate`, `FormattedTime`, `FormattedRelative`, `FormattedNumber`, `FormattedPlural`, `FormattedMessage`, `FormattedHTMLMessage`:
```
import { FormattedMessage } from 'react-intl'

const myComp = (firstName) => (
	<FormattedMessage
	    id='app.greeting'
	    description='Greeting to welcome the user to the app'
	    defaultMessage='Hello, {name}!'
	    values={{ name: firstName }}
	/>
)

export default myComp
```

  The HOC `injectIntl()` method injects into a component a [`intl` prop](https://github.com/yahoo/react-intl/wiki/API#intlshape) that exposes the following methods: `formatDate()`, `formatTime()`, `formatRelative()`, `formatNumber()`, `formatPlural()`, `formatMessage()`, `formatHTMLMessage()`:
```
import { injectIntl } from 'react-intl'

class MyComp extends React.Component {
	
	render() {

		var t = props.intl.formatMessage({ id: 'app.greeting' }, { name: firstName });

		return (
			<span>{t}</span>
		)
	}
}

const MyComp = injectIntl(MyComp);

export MyComp;
```
