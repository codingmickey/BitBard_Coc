import React, { useEffect, useState } from 'react';
import { Box, Typography, useTheme, useMediaQuery, Grid } from '@mui/material';
import Navbar from '../navbar';
import Header from './header';
import Filters from '../widgets/meetFilter';
import UserCard from '../../components/UserCard';
import { useSelector } from 'react-redux';
import axios from 'axios';

const MeetUp = () => {
  const isNonMobileScreens = useMediaQuery('(min-width:1000px)');
  const { _id, picturePath } = useSelector((state) => state.user);
  const [users, setUsers] = useState([]);

  const getPosts = async () => {
    const { data } = await axios.get(`http://localhost:3001/users`);
    setUsers(data);
    console.log(data);
  };

  useEffect(() => {
    // if (isProfile) {
    //   getUserPosts();
    // } else {
    //   getPosts();
    // }
    getPosts();
    // if(isProfile){
    //   getUserPosts();
    // }
  }, []);

  const sendMail = async () => {
    const response = await fetch(`http://localhost:3001/auth/email`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: 'varunvekaria@gmail.com',
        subject: 'Enquiry received for House Reallocation',
        html: '<h1>New query received for your house! </h1><p>Hi, I am interested in the house by looking at the pictures.</p> <p>Thanks</p><p>Name: Kartik</p>WhatsApp me at: https://wa.me/919619247188</p>'
        // attachments: ''
      })
    });
    const data = await response.json();
    console.log(data);
    const response1 = await fetch(`http://localhost:3001/auth/sms`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        to: '+919987772704',
        body: 'New Room Applicant Alert: Hi, I am interested in your house. Name: Kartik Phone: 9619247188, WhatsApp me at: https://wa.me/919619247188. Regards, Sainik Suvidha'
        // attachments: ''
      })
    });

    const data1 = await response1.json();
    console.log(data1);
  };

  return (
    <Box>
      <Navbar />
      <Header />
      <Box
        width="100%"
        padding="2rem 6%"
        display={isNonMobileScreens ? 'flex' : 'block'}
        gap="0.5rem"
        justifyContent="center"
      >
        <Box flexBasis={isNonMobileScreens ? '26%' : undefined}>
          <Filters userId={_id} picturePath={picturePath} />
        </Box>
        <Box flexBasis={isNonMobileScreens ? '60%' : undefined} mt={isNonMobileScreens ? undefined : '2rem'}>
          {/* <MyPostWidget picturePath={picturePath} /> */}
          {/* <JobPostsWidget userId={_id} /> */}
          <Grid container spacing={4}>
            {users.map((item) => (
              <Grid item xs={12} sm={6} md={4}>
                <UserCard
                  name={`${item.firstName} ${item.lastName}`}
                  image={item.picturePath}
                  datesAvailable={item.datesAvailable}
                />
              </Grid>
            ))}
          </Grid>
        </Box>
        {/* {isNonMobileScreens && (
          <Box flexBasis="26%">
            <AdvertWidget />
            <Box m="2rem 0" />
            <FriendListWidget userId={_id} />
          </Box>
        )} */}
      </Box>
    </Box>
  );
};

export default MeetUp;
