import React from 'react';

import { Control, Form, Errors } from 'react-redux-form';

import { isName, isEmail, isRequired, isPass, match } from '../validation/myValidators';

class MyForm extends React.Component {

  handleSubmit(val) {
    
    this.props.onSubmit(val);
  }

  render() {
    return (
      <Form model="registration"
            onSubmit={(val) => this.handleSubmit(val)}
            validators={ { "": { passMatch: (val) => match(val.pass,val.confirmPass) } } }
            validateOn="submit">

        <div>
          <label>First name:</label>
          <Control.text model="registration.firstName"
                        validators={ { isName, isRequired } }
                        validateOn="blur" />
          <Errors
            model="registration.firstName"
            messages={{
              isRequired: 'Please provide your first name.',
              isName: (val) => `${val} is not a valid name.`,
            }}
            show={(field) => field.touched && !field.focus}
          />
        </div>

        <div>
          <label>Last name:</label>
          <Control.text model="registration.lastName"
                        validators={ { isName, isRequired } }
                        validateOn="blur" />
          <Errors
            model="registration.lastName"
            messages={{
              isRequired: 'Please provide your last name.',
              isName: (val) => `${val} is not a valid name.`,
            }}
            show={(field) => field.touched && !field.focus}
          />
        </div>

        <div>
          <label>Email:</label>
          <Control.text
            type="email"
            model="registration.email"
            validators={{ isEmail, isRequired }}
            validateOn="blur"
          />
          <Errors
            model="registration.email"
            messages={{
              isRequired: 'Please provide an email address.',
              isEmail: (val) => `${val} is not a valid email.`,
            }}
            show={(field) => field.touched && !field.focus}
          />
        </div>

        <div>
          <label>Password:</label>
          <Control.text
            type="password"
            model="registration.pass"
            validators={{ isPass, isRequired }}
            validateOn="blur"
          />
          <Errors
            model="registration.pass"
            messages={{
              isPass: 'A valid password must be at least 6 char with at least one number',
              isRequired: 'Please provide a valid password'
            }}
            show={(field) => field.touched && !field.focus}
          />
        </div>
        <div>
          <label>Confirm password:</label>
          <Control.text
            type="password"
            model="registration.confirmPass"
            validators={{ isRequired }}
            validateOn="blur"
          />
          <Errors
            model="registration.confirmPass"
            messages={{
              isRequired: 'Please confirm your password'
            }}
            show={(field) => field.touched && !field.focus}
          />
        </div>
        <Errors
          model="registration"
          messages={{
            passMatch: 'The passwords do not match',
            api: 'An error occurred, try again later'
          }}
        />

        <button type="submit">
          Finish registration!
        </button>
      </Form>
    );
  }
}

export default MyForm;