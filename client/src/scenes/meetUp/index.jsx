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
        email: 'ghardik5902@gmail.com',
        subject: 'Fellow traveler connection!',
        html: 'Hi Hardik, I came across your profile on Wander Match and noticed that we both share a passion for travel. I would love to connect and swap travel stories with you. Maybe we can even plan a trip together someday? Looking forward to hearing back from you!<p>Thanks</p><p>Name: Kartik</p>WhatsApp me at: https://wa.me/919619247188</p>'
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
        to: '+918655252587',
        body: "New traveller connection Alert: Hi Hardik, Saw your travel profile on Wander Match and noticed we share a love for travel. Thought it'd be great to connect maybe even plan a trip together sometime? Kartik Jolapara, WhatsApp me at: https://wa.me/919619247188"
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
            {users.reverse().map((item) => (
              <Grid item xs={12} sm={6} md={4}>
                <UserCard
                  name={`${item.firstName} ${item.lastName}`}
                  image={item.picturePath}
                  datesAvailable={item.datesAvailable}
                  sendMail={sendMail}
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
