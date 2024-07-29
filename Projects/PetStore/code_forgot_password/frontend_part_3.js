import React, { useState } from 'react';
   import axios from 'axios';
   import { useParams, useHistory } from 'react-router-dom';

   const ResetPasswordPage = () => {
       const { token } = useParams();
       const history = useHistory();
       const [newPassword, setNewPassword] = useState('');
       const [confirmPassword, setConfirmPassword] = useState('');
       const [error, setError] = useState('');

       const handleSubmit = async (e) => {
           e.preventDefault();
           if (newPassword !== confirmPassword) {
               setError('Passwords do not match');
               return;
           }
           try {
               await axios.post('/submit-new-password/', { token, new_password: newPassword, confirm_password: confirmPassword });
               history.push('/');
           } catch (error) {
               setError(error.response.data.error);
           }
       };

       return (
           <div>
               <h2>Reset Password</h2>
               <form onSubmit={handleSubmit}>
                   <label>New Password:</label>
                   <input type="password" value={newPassword} onChange={(e) => setNewPassword(e.target.value)} required />
                   <label>Confirm Password:</label>
                   <input type="password" value={confirmPassword} onChange={(e) => setConfirmPassword(e.target.value)} required />
                   <button type="submit">Reset Password</button>
               </form>
               {error && <p>{error}</p>}
           </div>
       );
   };

   export default ResetPasswordPage;