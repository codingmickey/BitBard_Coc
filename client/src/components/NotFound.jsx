import React from 'react';
import { ReactComponent as YourSvg } from '../assets/404 Error with a cute animal-rafiki.svg';
import { Container } from '@mui/material';
import Navbar from 'scenes/navbar';

const NotFound = () => {
  return (
    <div>
      <>
        <Navbar />

        <Container
          sx={{
            height: '80vh',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            alignItems: 'center'
          }}
        >
          <YourSvg />
        </Container>
      </>
    </div>
  );
};

export default NotFound;
