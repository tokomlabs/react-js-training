import validator from 'validator';


export function isPass(val) {
	
	return !val.length || val.match(/(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9 _-]+){6,20}$/);
}

export function match(val1,val2) {
	
	return !val1.length || !val2.length || val1 === val2;
}

export function isEmail(val) {
	
	return !val.length || validator.isEmail(val);
}

export function isRequired(val) {

	
	return val && val.length;
}

export function isName(val) {
 
	return !val.match(/^([a-z][A-Z])$/);
}
