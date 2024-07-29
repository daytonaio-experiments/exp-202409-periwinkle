import React from 'react';
   import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
   import LoginPage from './LoginPage';
   import PasswordRecoveryPage from './PasswordRecoveryPage';
   import ResetPasswordPage from './ResetPasswordPage';

   const App = () => {
       return (
           <Router>
               <Switch>
                   <Route exact path="/" component={LoginPage} />
                   <Route path="/password-recovery" component={PasswordRecoveryPage} />
                   <Route path="/reset-password/:token" component={ResetPasswordPage} />
               </Switch>
           </Router>
       );
   };

   export default App;