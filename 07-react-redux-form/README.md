# React Redux Form

Eases the implementation of forms and form validation.

It's not the only one out there, see also:
- [redux-form](https://github.com/erikras/redux-form)
- [formsy-react](https://github.com/christianalfoni/formsy-react)
- ...


## References

* [React Redux Form Bible](https://davidkpiano.github.io/react-redux-form/docs.html)


## Installation

Ensure you have those dependencies installed:
```
npm install react react-dom react-redux redux redux-thunk --save
```

And then:
```
npm install react-redux-form@latest --save   # currently installs the new 1.0.x version
```


## Important RRF notions

* RRF uses it's own reducers & state to manage forms and validations

* RRF comes with a bunch of handy React components to implement forms and validation in JSX: `Form`, `Control`, `Field`, `Errors`

* RRF also exposes an API to control submition and validation via action creators: 
```
import { actions } from 'react-redux-form';

const { userForm, dispatch } = this.props;

dispatch(actions.validate('user.email', {
  required: (value) => value && value.length,
  valid: validator.isEmail
});

dispatch(actions.setValidity('user.email', {
  required: true,
  isEmail: false
});

// ...
```
  See [RRF actions creator API](https://davidkpiano.github.io/react-redux-form/docs/api/actions.html);

