import React from 'react';
   import { Link } from 'react-router-dom';

   const LoginPage = () => {
       return (
           <div>
               <h2>Login Page</h2>
               <form>
                   <label>Email:</label>
                   <input type="email" name="email" required />
                   <label>Password:</label>
                   <input type="password" name="password" required />
                   <button type="submit">Login</button>
               </form>
               <Link to="/password-recovery">Forgot password</Link>
           </div>
       );
   };

   export default LoginPage;