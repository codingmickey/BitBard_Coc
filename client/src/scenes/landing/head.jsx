import React from 'react';
import Carousel from 'fade-carousel';
import { Typography, Box, Button } from '@mui/material';
import ProfileCard from './profile'

function Head() {
  const urls = [
    'https://images.pexels.com/photos/13803162/pexels-photo-13803162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/2325446/pexels-photo-2325446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/2627246/pexels-photo-2627246.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
  ];

  const divStyle = {
    height: '600px',
    width: '100%',
    backgroundColor: '#f2f2f2'
  };
  const imageStyle = {
    height: '100%',
    width: '100%',
    justifySelf: 'center',
    paddingBottom: '10px',
    borderBottom: '10px solid #006B7D',
    borderBottomLeftRadius: '80px',
    borderBottomRightRadius: '80px'
  };
  const hello = () => {
    console.log('hello');
  };

  return (
    <Box sx={{width:'100%',mt:2, p:3,  borderTop:'10px solid #006b7d', borderTopLeftRadius: '80px',
    borderTopRightRadius: '80px'}}>
      <Box sx={{m:'auto', width:'100%', textAlign:'center'}}>
        <Typography fontWeight="bold" fontSize="32px">
          Connect With Travellers
        </Typography>
      </Box>
      <Box sx={{}}>
      <ProfileCard
              name="John Doe"
              imageUrl="https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              flagUrl="https://images.pexels.com/photos/1202723/pexels-photo-1202723.jpeg?auto=compress&cs=tinysrgb&w=1600"
            />
      </Box>
      <Box sx={{width:'100%', display:'flex', flexDirection:'column', alignItems:'center'}}>
        <Button variant="outlined" color="primary" sx={{ mt:1, m:'auto' }}>
          <Typography fontWeight="bold" fontSize="32px" color="primary">
            SEE MORE TRAVELLERS
          </Typography>
        </Button>
      </Box>
    </Box>
  );
}

export default Head;
