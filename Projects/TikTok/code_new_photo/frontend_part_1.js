import React, { useState } from 'react';
import axios from 'axios';

const ProfileSettings = () => {
    const [selectedFile, setSelectedFile] = useState(null);
    const [message, setMessage] = useState('');

    const handleFileChange = (event) => {
        setSelectedFile(event.target.files[0]);
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        if (!selectedFile) {
            setMessage('No photo selected');
            return;
        }

        const formData = new FormData();
        formData.append('profile_photo', selectedFile);

        try {
            const response = await axios.post('/change-profile-photo/', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            setMessage(response.data.success || response.data.error);
        } catch (error) {
            setMessage('Error uploading photo');
        }
    };

    return (
        <div>
            <h2>Profile Settings</h2>
            <form onSubmit={handleSubmit}>
                <input type="file" onChange={handleFileChange} />
                <button type="submit">Change Profile Photo</button>
            </form>
            {message && <p>{message}</p>}
        </div>
    );
};

export default ProfileSettings;