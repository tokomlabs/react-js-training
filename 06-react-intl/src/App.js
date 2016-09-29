import React from 'react';

import {
  IntlProvider,
  addLocaleData,
  injectIntl,
  FormattedMessage,
  FormattedDate
} from 'react-intl';

import frLocaleData from 'react-intl/locale-data/fr';
import enLocaleData from 'react-intl/locale-data/en';

const messages = {
  fr: require('../app/lang/fr.json'),
  en: require('../app/lang/en.json')
}

const Comp01 = (props) => 
  <div>
    <h1><FormattedMessage id={"greetings"} values={{name: props.name}}/></h1>
    <p><FormattedMessage id={"msg-count"} values={{count: props.count}}/></p>
    <p><FormattedDate value={props.datetime} /></p>
  </div>


const Comp02 = injectIntl((props) => {

  var t1 = props.intl.formatMessage({ id: "greetings" }, { name : props.name }); 
  var t2 = props.intl.formatMessage({ id: "msg-count" }, { count : props.count }); 
  var t3 = props.intl.formatDate(props.datetime); 

  return (
    <div>
      <h1>{ t1 }</h1>
      <p>{ t2 }</p>
      <p>{ t3 }</p>
    </div>
  )
})

class App extends React.Component {

  constructor() {
    super();
    this.state = { locale: navigator.language }
  }

  componentWillMount() {

    addLocaleData(frLocaleData);
    addLocaleData(enLocaleData);
  }

  switchTo(l) {

    this.setState({ locale: l });
  }

  render(){

    var name = "Thomas";
    var cnt = Math.floor((Math.random() * 2) + 1);
    var dt = Date.now();

    var locale = this.state.locale;

    if (locale.indexOf("-") > -1) locale = locale.substr(0,2);

    return (
      <IntlProvider locale={locale} messages={messages[locale]}>
        <div>
          <div>
            <Comp01 name={name} datetime={dt} count={cnt} />
          </div>
          <div>
            <Comp02 name={name} datetime={dt} count={cnt} />
          </div>
          <button onClick={(e) => this.switchTo("fr")}>FR</button>
          <button onClick={(e) => this.switchTo("en")}>EN</button>
        </div>
      </IntlProvider>
    )
  }
}

export default App;