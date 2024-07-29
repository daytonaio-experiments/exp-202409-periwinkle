// BackgroundColorChanger.js
import React, { useEffect, useState } from 'react';

const BackgroundColorChanger = () => {
    const [backgroundColor, setBackgroundColor] = useState('light');

    useEffect(() => {
        fetch('/api/get-background-color/')
            .then(response => response.json())
            .then(data => setBackgroundColor(data.background_color));
    }, []);

    const changeBackgroundColor = (color) => {
        fetch('/api/set-background-color/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': getCookie('csrftoken')
            },
            body: JSON.stringify({ color })
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                setBackgroundColor(color);
            } else {
                alert(data.message);
            }
        });
    };

    const getCookie = (name) => {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    };

    return (
        <div style={{ backgroundColor }}>
            <h1>Homepage</h1>
            <button onClick={() => changeBackgroundColor('light')}>Light Mode</button>
            <button onClick={() => changeBackgroundColor('dark')}>Dark Mode</button>
        </div>
    );
};

export default BackgroundColorChanger;