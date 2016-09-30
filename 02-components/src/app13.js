import React from 'react';
import ReactDOM from 'react-dom';

import Parse from 'parse';

const PersonObject = Parse.Object.extend("PersonObject");

// Container

class PersonManager extends React.Component {

	constructor() {

		super();

		this.state = { list: [] }
	}

	componentWillMount() {

		Parse.initialize("L182Ape13fgpKc1eW5wTABM39esMlx0fWwbqfZzB", "nDqCS4x5xQ1cwDzxPr8B64oAM14WpjCKnA0weDJT");
		Parse.serverURL = 'https://parseapi.back4app.com/'

		var query = new Parse.Query(PersonObject);

		var pm = this;

		query.find({

			success: function(results) {

				console.log("Successfully retrieved " + results.length + " person(s).");

				var ps = [];

				for (var i = 0; i < results.length; i++) {
					ps.push({ id: results[i].id, name: results[i].get("name") });
				}
				
				pm.setState({ list: ps });
			},
			error: function(error) {

				console.error("Parse Error: " + error.code + " " + error.message);
			}
		});
	}

	addPerson(v) {

		var po = new PersonObject();

		var pm = this;
		
		po.save({ name: v }).then(
			
			function(object) {
		  	
		  		console.log('person saved with id: '+object.id);

		  		pm.setState({ list: [...pm.state.list, { id: object.id, name: object.get("name") }] });
			}
		);
	}

	render() { console.log(this.state);

		return <PersonList persons={this.state.list} onNewPerson={(p) => this.addPerson(p)} />
	}
}



// Presentation

class PersonInput extends React.Component {

	render() {

		return (
			<div>
				Name: <input type="text" ref="pi" />
				<button onClick={ (e) => this.props.onAdd(this.refs.pi.value) }>Add</button>
			</div>
		)
	}
}

const PersonList = (props) => {

	console.log(props.persons.length);

	var personNodes = props.persons.map(function(person) {
		return (
			<tr key={person.id}>
				<td>{person.name}</td>
			</tr>
		);
	});

	return (
		<div>
			<PersonInput onAdd={ props.onNewPerson } />
			<table>
				<tbody>
					{ personNodes }
				</tbody>
			</table>
		</div>
	)
}


// App root comp

class App extends React.Component {

	render() {

		return (
			<div>
				<PersonManager />
			</div>
		)
	}
}

export default App
