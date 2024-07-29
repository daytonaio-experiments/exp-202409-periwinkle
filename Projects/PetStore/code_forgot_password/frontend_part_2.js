import React, { useState } from 'react';
   import axios from 'axios';

   const PasswordRecoveryPage = () => {
       const [email, setEmail] = useState('');
       const [message, setMessage] = useState('');
       const [error, setError] = useState('');

       const handleSubmit = async (e) => {
           e.preventDefault();
           try {
               const response = await axios.post('/submit-recovery-form/', { email });
               setMessage(response.data.message);
               setError('');
           } catch (error) {
               setError(error.response.data.error);
               setMessage('');
           }
       };

       return (
           <div>
               <h2>Password Recovery</h2>
               <form onSubmit={handleSubmit}>
                   <label>Email:</label>
                   <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
                   <button type="submit">Submit</button>
               </form>
               {message && <p>{message}</p>}
               {error && <p>{error}</p>}
           </div>
       );
   };

   export default PasswordRecoveryPage;