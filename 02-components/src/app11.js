import React from 'react';
import ReactDOM from 'react-dom';

class App11 extends React.Component {

	constructor(){

		super();
	
		this.state = 

			{
			  val: 0
			}

		this.update = this.update.bind(this)
	}
	
	update(v){
	
		this.setState(
			{
			  val: v
			}
		)
	}

	render(){

		return (
			<div>
				<NumInput
				  ref="red"
				  min={0}
				  max={255}
				  step={0.01}
				  val={+this.state.val}
				  label="Red"
				  update={this.update} />
			</div>
		);
	}
}

class NumInput extends React.Component {

	constructor() {

		super();
	
		this.update = this.update.bind(this)
	}
	
	update(e){
	
		this.props.update(ReactDOM.findDOMNode(this.refs.inp).value);
	}

	render() {

		let label = this.props.label !== '' ?
		  				
		  				<label>{this.props.label} -  {this.props.val}</label> :

		  				'';

		return (
		    <div>
			    <input ref="inp"
			    	   type={this.props.type}
			    	   min={this.props.min}
			    	   max={this.props.max}
			    	   step={this.props.step}
			    	   defaultValue={this.props.val}
			    	   onChange={this.update} />

			      {label}
		    </div>
		);
	}
}

NumInput.propTypes = 

	{
		min: React.PropTypes.number,
		max: React.PropTypes.number,
		step: React.PropTypes.number,
		val: React.PropTypes.number,
		label: React.PropTypes.string,
		update: React.PropTypes.func.isRequired,
		type: React.PropTypes.oneOf(['number', 'range'])
	}

NumInput.defaultProps = 

	{
		min: 0,
		max: 0,
		step: 1,
		val: 0,
		label: '',
		type: 'range'
	}

export default App11